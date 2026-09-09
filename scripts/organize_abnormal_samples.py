#!/usr/bin/env python3
"""Organize locally reproduced non-normal termination samples."""

import argparse
import datetime
import hashlib
import json
import os
import pathlib
import signal
import subprocess
import tempfile


DEFAULT_RECORDED_ENVIRONMENT = (
    "ASAN_OPTIONS",
    "UBSAN_OPTIONS",
    "PLC_LAB_CYCLE_COUNT",
    "PLC_LAB_CYCLE_DELAY_NS",
)


def sha256_bytes(data):
    return hashlib.sha256(data).hexdigest()


def sha256_file(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def git_revision(repo_root, revision):
    try:
        return subprocess.check_output(
            ["git", "-C", str(repo_root), "rev-parse", revision],
            stderr=subprocess.DEVNULL,
            text=True,
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        return "unknown"


def diagnostic_environment():
    environment = os.environ.copy()
    environment.setdefault("ASAN_OPTIONS", "abort_on_error=1:disable_coredump=1:symbolize=1")
    environment.setdefault("UBSAN_OPTIONS", "halt_on_error=1:abort_on_error=1:print_stacktrace=1")
    environment.setdefault("PLC_LAB_CYCLE_DELAY_NS", "0")
    return environment


def run_sample(target, data, timeout_seconds, environment):
    with tempfile.TemporaryDirectory(prefix="plc-lab-sample-") as directory:
        sample_path = pathlib.Path(directory) / "sample.bin"
        sample_path.write_bytes(data)
        try:
            result = subprocess.run(
                [str(target), str(sample_path)],
                cwd=directory,
                env=environment,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                timeout=timeout_seconds,
                check=False,
            )
            return {
                "returncode": result.returncode,
                "stdout": result.stdout,
                "stderr": result.stderr,
                "timed_out": False,
            }
        except subprocess.TimeoutExpired as error:
            return {
                "returncode": None,
                "stdout": error.stdout or b"",
                "stderr": error.stderr or b"",
                "timed_out": True,
            }


def stable_signal(target, data, repeats, timeout_seconds, environment, expected_signal=None):
    observations = []
    for _ in range(repeats):
        observation = run_sample(target, data, timeout_seconds, environment)
        observations.append(observation)
        returncode = observation["returncode"]
        if observation["timed_out"] or returncode is None or returncode >= 0:
            return None, observations
        observed_signal = -returncode
        if expected_signal is None:
            expected_signal = observed_signal
        if observed_signal != expected_signal:
            return None, observations
    return expected_signal, observations


def minimize_sample(target, data, expected_signal, timeout_seconds, environment, max_evaluations):
    current = data
    granularity = 2
    evaluations = 0

    while len(current) >= 2 and evaluations < max_evaluations:
        chunk_size = (len(current) + granularity - 1) // granularity
        reduced = False
        for start in range(0, len(current), chunk_size):
            if evaluations >= max_evaluations:
                break
            candidate = current[:start] + current[start + chunk_size :]
            if not candidate:
                continue
            evaluations += 1
            observed_signal, _ = stable_signal(
                target,
                candidate,
                1,
                timeout_seconds,
                environment,
                expected_signal,
            )
            if observed_signal == expected_signal:
                current = candidate
                granularity = max(2, granularity - 1)
                reduced = True
                break
        if reduced:
            continue
        if granularity >= len(current):
            break
        granularity = min(len(current), granularity * 2)

    return current, evaluations


def collect_unique_samples(input_dir):
    unique = {}
    scanned = 0
    for path in sorted(item for item in input_dir.rglob("*") if item.is_file()):
        scanned += 1
        data = path.read_bytes()
        digest = sha256_bytes(data)
        if digest not in unique:
            unique[digest] = (path, data)
    return scanned, unique


def ensure_output_directory(path):
    if path.exists() and any(path.iterdir()):
        raise ValueError("output directory is not empty: {}".format(path))
    path.mkdir(parents=True, exist_ok=True)


def parse_args(argv=None):
    parser = argparse.ArgumentParser(
        description="Deduplicate, reproduce, minimize, and record local non-normal termination samples."
    )
    parser.add_argument("--input-dir", required=True, type=pathlib.Path)
    parser.add_argument("--output-dir", required=True, type=pathlib.Path)
    parser.add_argument("--target", required=True, type=pathlib.Path)
    parser.add_argument("--repeats", type=int, default=3)
    parser.add_argument("--timeout", type=float, default=10.0)
    parser.add_argument("--max-minimize-evaluations", type=int, default=500)
    parser.add_argument("--seed", default="unknown")
    parser.add_argument("--compiler-commit")
    parser.add_argument("--record-env", action="append", default=[])
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.repeats < 2:
        raise ValueError("--repeats must be at least 2")
    if args.timeout <= 0:
        raise ValueError("--timeout must be positive")
    if args.max_minimize_evaluations < 0:
        raise ValueError("--max-minimize-evaluations must be non-negative")

    input_dir = args.input_dir.resolve()
    output_dir = args.output_dir.resolve()
    target = args.target.resolve()
    if not input_dir.is_dir():
        raise ValueError("input directory does not exist: {}".format(input_dir))
    if not target.is_file() or not os.access(str(target), os.X_OK):
        raise ValueError("target is not executable: {}".format(target))
    ensure_output_directory(output_dir)

    repo_root = pathlib.Path(__file__).resolve().parent.parent
    environment = diagnostic_environment()
    recorded_names = sorted(set(DEFAULT_RECORDED_ENVIRONMENT + tuple(args.record_env)))
    recorded_environment = {name: environment[name] for name in recorded_names if name in environment}
    scanned_count, unique_samples = collect_unique_samples(input_dir)
    target_digest = sha256_file(target)
    compiler_commit = args.compiler_commit or git_revision(repo_root, "HEAD:third_party/matiec")

    retained_cases = []
    for source_digest, (source_path, source_data) in sorted(unique_samples.items()):
        observed_signal, _ = stable_signal(
            target, source_data, args.repeats, args.timeout, environment
        )
        if observed_signal is None:
            continue

        minimized_data, evaluations = minimize_sample(
            target,
            source_data,
            observed_signal,
            args.timeout,
            environment,
            args.max_minimize_evaluations,
        )
        final_signal, final_observations = stable_signal(
            target,
            minimized_data,
            args.repeats,
            args.timeout,
            environment,
            observed_signal,
        )
        if final_signal != observed_signal:
            continue

        case_id = source_digest[:16]
        case_dir = output_dir / "cases" / case_id
        case_dir.mkdir(parents=True)
        minimized_path = case_dir / "sample.bin"
        minimized_path.write_bytes(minimized_data)
        final_observation = final_observations[-1]
        diagnostic_path = case_dir / "diagnostic.txt"
        diagnostic_path.write_bytes(
            b"STDERR\n" + final_observation["stderr"] + b"\nSTDOUT\n" + final_observation["stdout"]
        )

        minimized_digest = sha256_bytes(minimized_data)
        case_metadata = {
            "case_id": case_id,
            "source_path": str(source_path.relative_to(input_dir)),
            "source_sha256": source_digest,
            "source_size": len(source_data),
            "minimized_sha256": minimized_digest,
            "minimized_size": len(minimized_data),
            "signal": observed_signal,
            "signal_name": signal.Signals(observed_signal).name,
            "repetitions": args.repeats,
            "timeout_seconds": args.timeout,
            "minimize_evaluations": evaluations,
            "sample": str(minimized_path.relative_to(output_dir)),
            "diagnostic": str(diagnostic_path.relative_to(output_dir)),
        }
        (case_dir / "case.json").write_text(
            json.dumps(case_metadata, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        retained_cases.append(case_metadata)

    manifest = {
        "schema": "PLC_LAB_ABNORMAL_SAMPLE_MANIFEST_V1",
        "created_at_utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "repository_commit": git_revision(repo_root, "HEAD"),
        "matiec_commit": compiler_commit,
        "target": str(target),
        "target_sha256": target_digest,
        "command": [str(target), "{sample}"],
        "seed": args.seed,
        "environment": recorded_environment,
        "repetitions": args.repeats,
        "timeout_seconds": args.timeout,
        "max_minimize_evaluations": args.max_minimize_evaluations,
        "scanned_files": scanned_count,
        "unique_inputs": len(unique_samples),
        "retained_cases": retained_cases,
    }
    (output_dir / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        "Organized {} unique inputs into {} stable cases.".format(
            len(unique_samples), len(retained_cases)
        )
    )
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError) as error:
        print("Sample organization failed: {}".format(error), file=os.sys.stderr)
        raise SystemExit(2)
