#!/usr/bin/env python3
"""Create and finalize manifests for isolated academic experiment runs."""

import argparse
import datetime
import hashlib
import json
import os
import pathlib
import platform
import shutil
import subprocess
import tempfile


SCHEMA = "PLC_LAB_EXPERIMENT_MANIFEST_V1"
RECORDED_ENVIRONMENT = (
    "AFL_AUTORESUME",
    "AFL_CUSTOM_MUTATOR_LIBRARY",
    "AFL_MAP_SIZE",
    "AFL_SKIP_CPUFREQ",
    "PLC_LAB_CYCLE_COUNT",
    "PLC_LAB_CYCLE_DELAY_NS",
)


def utc_now():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def sha256_file(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def git_revision(repo_root, revision, fallback_environment):
    try:
        return subprocess.check_output(
            ["git", "-C", str(repo_root), "rev-parse", revision],
            stderr=subprocess.DEVNULL,
            text=True,
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        fallback = os.environ.get(fallback_environment, "")
        if len(fallback) == 40 and all(character in "0123456789abcdefABCDEF" for character in fallback):
            return fallback.lower()
        return "unknown"


def tool_version(executable):
    try:
        result = subprocess.run(
            [str(executable), "--version"],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            timeout=10,
            check=False,
        )
    except (OSError, subprocess.TimeoutExpired):
        return "unknown"
    lines = result.stdout.strip().splitlines()
    return lines[0] if lines else "unknown"


def atomic_write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    handle, temporary_name = tempfile.mkstemp(prefix=path.name + ".", dir=str(path.parent))
    try:
        with os.fdopen(handle, "w", encoding="utf-8") as stream:
            json.dump(value, stream, indent=2, sort_keys=True)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, str(path))
    except Exception:
        try:
            os.unlink(temporary_name)
        except OSError:
            pass
        raise


def resolve_executable(value):
    candidate = pathlib.Path(value)
    if candidate.parent != pathlib.Path(".") or candidate.is_absolute():
        resolved = candidate.resolve()
    else:
        located = shutil.which(value)
        if located is None:
            raise ValueError("executable is not available: {}".format(value))
        resolved = pathlib.Path(located).resolve()
    if not resolved.is_file() or not os.access(str(resolved), os.X_OK):
        raise ValueError("executable is not available: {}".format(value))
    return resolved


def create_directory(observations_root, explicit_directory, repository_commit):
    if explicit_directory is not None:
        directory = explicit_directory.resolve()
        if directory.exists():
            raise ValueError("experiment directory already exists: {}".format(directory))
        directory.mkdir(parents=True)
        return directory

    root = observations_root.resolve()
    root.mkdir(parents=True, exist_ok=True)
    timestamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    prefix = "run-{}-{}-".format(timestamp, repository_commit[:12])
    return pathlib.Path(tempfile.mkdtemp(prefix=prefix, dir=str(root)))


def create_manifest(args):
    repo_root = args.repo_root.resolve()
    target = resolve_executable(str(args.target))
    input_tool = resolve_executable(args.input_tool)
    input_samples_dir = args.input_samples_dir.resolve()
    grammar = args.grammar.resolve()
    input_transformer = args.input_transformer.resolve()
    for path, label in (
        (input_samples_dir, "input samples directory"),
        (grammar, "grammar"),
        (input_transformer, "input transformer"),
    ):
        if not path.exists():
            raise ValueError("{} does not exist: {}".format(label, path))

    repository_commit = git_revision(repo_root, "HEAD", "PLC_LAB_SOURCE_REVISION")
    matiec_commit = git_revision(repo_root, "HEAD:third_party/matiec", "PLC_LAB_MATIEC_REVISION")
    experiment_dir = create_directory(args.observations_root, args.experiment_dir, repository_commit)
    output_dir = experiment_dir / "afl-output"
    command = [
        str(input_tool),
        "-V",
        str(args.duration),
        "-t",
        str(args.timeout),
        "-i",
        str(input_samples_dir),
        "-o",
        str(output_dir),
        "-g",
        str(grammar),
        "--",
        str(target),
        "@@",
    ]
    recorded_environment = {
        name: os.environ[name] for name in RECORDED_ENVIRONMENT if name in os.environ
    }
    manifest = {
        "schema": SCHEMA,
        "status": "running",
        "started_at_utc": utc_now(),
        "completed_at_utc": None,
        "exit_code": None,
        "repository_commit": repository_commit,
        "matiec_commit": matiec_commit,
        "input_tool_version": tool_version(input_tool),
        "target": str(target),
        "target_sha256": sha256_file(target),
        "duration_seconds": args.duration,
        "timeout_milliseconds": args.timeout,
        "input_samples_dir": str(input_samples_dir),
        "grammar": str(grammar),
        "input_transformer": str(input_transformer),
        "output_dir": str(output_dir),
        "command": command,
        "environment": recorded_environment,
        "machine": {
            "system": platform.system(),
            "release": platform.release(),
            "machine": platform.machine(),
            "processor": platform.processor(),
            "cpu_count": os.cpu_count(),
            "python": platform.python_version(),
        },
    }
    atomic_write_json(experiment_dir / "manifest.json", manifest)
    print(experiment_dir)


def finish_manifest(args):
    manifest_path = args.manifest.resolve()
    if not manifest_path.is_file():
        raise ValueError("manifest does not exist: {}".format(manifest_path))
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest.get("schema") != SCHEMA:
        raise ValueError("unsupported manifest schema in {}".format(manifest_path))
    manifest["completed_at_utc"] = utc_now()
    manifest["exit_code"] = args.exit_code
    if args.interrupted:
        manifest["status"] = "interrupted"
    elif args.exit_code == 0:
        manifest["status"] = "success"
    else:
        manifest["status"] = "nonzero"
    atomic_write_json(manifest_path, manifest)


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description="Manage isolated PLC Robustness Lab experiment manifests.")
    subparsers = parser.add_subparsers(dest="command_name", required=True)

    create = subparsers.add_parser("create", help="create a new experiment directory and manifest")
    create.add_argument("--repo-root", required=True, type=pathlib.Path)
    create.add_argument("--observations-root", required=True, type=pathlib.Path)
    create.add_argument("--experiment-dir", type=pathlib.Path)
    create.add_argument("--target", required=True, type=pathlib.Path)
    create.add_argument("--input-samples-dir", required=True, type=pathlib.Path)
    create.add_argument("--grammar", required=True, type=pathlib.Path)
    create.add_argument("--input-transformer", required=True, type=pathlib.Path)
    create.add_argument("--duration", required=True, type=int)
    create.add_argument("--timeout", required=True, type=int)
    create.add_argument("--input-tool", default="afl-fuzz")
    create.set_defaults(function=create_manifest)

    finish = subparsers.add_parser("finish", help="finalize an existing experiment manifest")
    finish.add_argument("--manifest", required=True, type=pathlib.Path)
    finish.add_argument("--exit-code", required=True, type=int)
    finish.add_argument("--interrupted", action="store_true")
    finish.set_defaults(function=finish_manifest)
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    if args.command_name == "create":
        if args.duration <= 0:
            raise ValueError("duration must be positive")
        if args.timeout <= 0:
            raise ValueError("timeout must be positive")
    args.function(args)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print("Experiment manifest operation failed: {}".format(error), file=os.sys.stderr)
        raise SystemExit(2)
