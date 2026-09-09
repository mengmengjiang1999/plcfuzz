#!/usr/bin/env python3
"""Exercise experiment manifest creation, finalization, and isolation."""

import hashlib
import json
import os
import pathlib
import subprocess
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
HELPER = REPO_ROOT / "scripts" / "experiment_manifest.py"
VERSION_TOOL = REPO_ROOT / "tests" / "fixtures" / "afl_version_tool.py"


def run(*arguments, environment=None, check=True):
    return subprocess.run(
        ["python3", str(HELPER), *map(str, arguments)],
        check=check,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        env=environment,
    )


def main():
    with tempfile.TemporaryDirectory(prefix="plcfuzz-experiment-test-") as temporary:
        root = pathlib.Path(temporary)
        findings = root / "findings"
        explicit = root / "named-run"
        seeds = root / "seeds"
        seeds.mkdir()
        (seeds / "sample").write_bytes(b"sample")
        grammar = root / "plc.grammar"
        grammar.write_text('start = "sample"\n', encoding="utf-8")
        mutator = root / "libplc_mutator.so"
        mutator.write_bytes(b"component")
        target = root / "target"
        target.write_bytes(b"target-content")
        target.chmod(0o755)

        environment = dict(os.environ)
        environment["PLCFUZZ_CYCLE_COUNT"] = "250"
        created = run(
            "create",
            "--repo-root", REPO_ROOT,
            "--findings-root", findings,
            "--experiment-dir", explicit,
            "--target", target,
            "--seed-dir", seeds,
            "--grammar", grammar,
            "--mutator", mutator,
            "--duration", "60",
            "--timeout", "2000",
            "--afl-binary", VERSION_TOOL,
            environment=environment,
        )
        explicit = explicit.resolve()
        assert pathlib.Path(created.stdout.strip()) == explicit
        manifest_path = explicit / "manifest.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        assert manifest["schema"] == "PLCFUZZ_EXPERIMENT_MANIFEST_V1"
        assert manifest["status"] == "running"
        assert len(manifest["repository_commit"]) == 40
        assert len(manifest["matiec_commit"]) == 40
        assert manifest["afl_version"] == "afl-fuzz ++5.03c fixture"
        assert manifest["target_sha256"] == hashlib.sha256(b"target-content").hexdigest()
        assert manifest["duration_seconds"] == 60
        assert manifest["timeout_milliseconds"] == 2000
        assert manifest["environment"]["PLCFUZZ_CYCLE_COUNT"] == "250"
        assert manifest["command"][-2:] == [str(target.resolve()), "@@"]
        assert manifest["output_dir"] == str(explicit / "afl-output")
        assert manifest["machine"]["cpu_count"] is not None

        run("finish", "--manifest", manifest_path, "--exit-code", "0")
        completed = json.loads(manifest_path.read_text(encoding="utf-8"))
        assert completed["status"] == "success"
        assert completed["exit_code"] == 0
        assert completed["completed_at_utc"] is not None

        repeated = run(
            "create",
            "--repo-root", REPO_ROOT,
            "--findings-root", findings,
            "--experiment-dir", explicit,
            "--target", target,
            "--seed-dir", seeds,
            "--grammar", grammar,
            "--mutator", mutator,
            "--duration", "60",
            "--timeout", "2000",
            "--afl-binary", VERSION_TOOL,
            check=False,
        )
        assert repeated.returncode == 2
        assert "already exists" in repeated.stderr

        default_arguments = (
            "create",
            "--repo-root", REPO_ROOT,
            "--findings-root", findings,
            "--target", target,
            "--seed-dir", seeds,
            "--grammar", grammar,
            "--mutator", mutator,
            "--duration", "60",
            "--timeout", "2000",
            "--afl-binary", VERSION_TOOL,
        )
        first = pathlib.Path(run(*default_arguments).stdout.strip())
        second = pathlib.Path(run(*default_arguments).stdout.strip())
        assert first != second
        assert first.parent == findings.resolve()
        assert second.parent == findings.resolve()

        launcher_run = root / "launcher-run"
        launcher_environment = dict(os.environ)
        launcher_environment.update(
            {
                "SEED_DIR": str(seeds),
                "EXPERIMENT_DIR": str(launcher_run),
                "AFL_GRAMMAR": str(grammar),
                "AFL_CUSTOM_MUTATOR_LIBRARY": str(mutator),
                "FUZZ_TARGET": str(target),
                "AFL_FUZZ_BINARY": str(VERSION_TOOL),
                "FUZZ_DURATION": "10",
                "FUZZ_TIMEOUT": "1000",
            }
        )
        launched = subprocess.run(
            [str(REPO_ROOT / "scripts" / "plcfuzz"), "experiment"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=launcher_environment,
        )
        assert "Experiment directory: {}".format(launcher_run.resolve()) in launched.stdout
        launched_manifest = json.loads(
            (launcher_run / "manifest.json").read_text(encoding="utf-8")
        )
        assert launched_manifest["status"] == "success"
        assert launched_manifest["exit_code"] == 0
        assert (launcher_run / "afl-output" / "fixture-complete").is_file()


if __name__ == "__main__":
    main()
