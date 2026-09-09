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
VERSION_TOOL = REPO_ROOT / "tests" / "fixtures" / "input_tool_version_fixture.py"
PROTOCOL = REPO_ROOT / "evaluation" / "protocol-v1.json"


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
    with tempfile.TemporaryDirectory(prefix="plc-lab-experiment-test-") as temporary:
        root = pathlib.Path(temporary)
        observations = root / "observations"
        explicit = root / "named-run"
        input_samples = root / "input_samples"
        input_samples.mkdir()
        (input_samples / "sample").write_bytes(b"sample")
        grammar = root / "plc.grammar"
        grammar.write_text('start = "sample"\n', encoding="utf-8")
        input_transformer = root / "libplc_input_transformer.so"
        input_transformer.write_bytes(b"component")
        target = root / "target"
        target.write_bytes(b"target-content")
        target.chmod(0o755)

        environment = dict(os.environ)
        environment["PLC_LAB_CYCLE_COUNT"] = "250"
        created = run(
            "create",
            "--repo-root", REPO_ROOT,
            "--observations-root", observations,
            "--experiment-dir", explicit,
            "--target", target,
            "--input-samples-dir", input_samples,
            "--grammar", grammar,
            "--adapter", input_transformer,
            "--duration", "60",
            "--timeout", "2000",
            "--input-tool", VERSION_TOOL,
            environment=environment,
        )
        explicit = explicit.resolve()
        assert pathlib.Path(created.stdout.strip()) == explicit
        manifest_path = explicit / "manifest.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        assert manifest["schema"] == "PLC_LAB_EXPERIMENT_MANIFEST_V1"
        assert manifest["status"] == "running"
        assert len(manifest["repository_commit"]) == 40
        assert len(manifest["matiec_commit"]) == 40
        assert manifest["input_tool_version"] == "afl-fuzz ++5.03c fixture"
        assert manifest["target_sha256"] == hashlib.sha256(b"target-content").hexdigest()
        assert manifest["duration_seconds"] == 60
        assert manifest["timeout_milliseconds"] == 2000
        assert manifest["environment"]["PLC_LAB_CYCLE_COUNT"] == "250"
        assert manifest["command"][-2:] == [str(target.resolve()), "@@"]
        assert manifest["output_dir"] == str(explicit / "afl-output")
        assert manifest["machine"]["cpu_count"] is not None
        assert manifest["input_generation"]["strategy_id"] == "structure-aware"
        assert manifest["input_generation"]["grammar_enabled"] is True
        assert manifest["input_generation"]["adapter_enabled"] is True
        assert manifest["input_generation"]["adapter_only"] is False

        run("finish", "--manifest", manifest_path, "--exit-code", "0")
        completed = json.loads(manifest_path.read_text(encoding="utf-8"))
        assert completed["status"] == "success"
        assert completed["exit_code"] == 0
        assert completed["completed_at_utc"] is not None

        repeated = run(
            "create",
            "--repo-root", REPO_ROOT,
            "--observations-root", observations,
            "--experiment-dir", explicit,
            "--target", target,
            "--input-samples-dir", input_samples,
            "--grammar", grammar,
            "--adapter", input_transformer,
            "--duration", "60",
            "--timeout", "2000",
            "--input-tool", VERSION_TOOL,
            check=False,
        )
        assert repeated.returncode == 2
        assert "already exists" in repeated.stderr

        default_arguments = (
            "create",
            "--repo-root", REPO_ROOT,
            "--observations-root", observations,
            "--target", target,
            "--input-samples-dir", input_samples,
            "--grammar", grammar,
            "--adapter", input_transformer,
            "--duration", "60",
            "--timeout", "2000",
            "--input-tool", VERSION_TOOL,
        )
        first = pathlib.Path(run(*default_arguments).stdout.strip())
        second = pathlib.Path(run(*default_arguments).stdout.strip())
        assert first != second
        assert first.parent == observations.resolve()
        assert second.parent == observations.resolve()

        launcher_run = root / "launcher-run"
        launcher_environment = dict(os.environ)
        launcher_environment.update(
            {
                "INPUT_SAMPLES_DIR": str(input_samples),
                "EXPERIMENT_DIR": str(launcher_run),
                "AFL_GRAMMAR": str(grammar),
                "PLC_LAB_INPUT_TRANSFORMER_LIBRARY": str(input_transformer),
                "INSTRUMENTED_TARGET": str(target),
                "AUTOMATED_INPUT_TOOL": str(VERSION_TOOL),
                "EXPERIMENT_DURATION": "10",
                "EXECUTION_TIMEOUT": "1000",
            }
        )
        launched = subprocess.run(
            [str(REPO_ROOT / "scripts" / "plc-lab"), "experiment"],
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
        structure_invocation = json.loads(
            (launcher_run / "afl-output" / "fixture-invocation.json").read_text(encoding="utf-8")
        )
        assert "-g" in structure_invocation["arguments"]
        assert structure_invocation["adapter"] == str(input_transformer)
        assert structure_invocation["adapter_only"] is None

        random_run = root / "random-run"
        random_environment = dict(launcher_environment)
        random_environment.update(
            {"EXPERIMENT_DIR": str(random_run), "PLC_LAB_INPUT_STRATEGY": "random-bytes"}
        )
        subprocess.run(
            [str(REPO_ROOT / "scripts" / "plc-lab"), "experiment"],
            check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
            env=random_environment,
        )
        random_manifest = json.loads((random_run / "manifest.json").read_text(encoding="utf-8"))
        random_invocation = json.loads(
            (random_run / "afl-output" / "fixture-invocation.json").read_text(encoding="utf-8")
        )
        assert random_manifest["input_generation"]["strategy_id"] == "random-bytes"
        assert random_manifest["input_generation"]["grammar_enabled"] is False
        assert random_manifest["input_generation"]["adapter_enabled"] is False
        assert "-g" not in random_invocation["arguments"]
        assert random_invocation["adapter"] is None
        assert random_invocation["adapter_only"] is None

        protocol_run = root / "protocol-run"
        protocol_environment = dict(launcher_environment)
        protocol_environment.update(
            {"EXPERIMENT_DIR": str(protocol_run), "PLC_LAB_INPUT_STRATEGY": "protocol-valid"}
        )
        subprocess.run(
            [str(REPO_ROOT / "scripts" / "plc-lab"), "experiment"],
            check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
            env=protocol_environment,
        )
        protocol_manifest = json.loads((protocol_run / "manifest.json").read_text(encoding="utf-8"))
        protocol_invocation = json.loads(
            (protocol_run / "afl-output" / "fixture-invocation.json").read_text(encoding="utf-8")
        )
        assert protocol_manifest["input_generation"]["strategy_id"] == "protocol-valid"
        assert protocol_manifest["input_generation"]["grammar_enabled"] is True
        assert protocol_manifest["input_generation"]["adapter_enabled"] is False
        assert "-g" in protocol_invocation["arguments"]
        assert protocol_invocation["adapter"] is None

        evaluation_run = root / "evaluation-run"
        evaluation_environment = dict(launcher_environment)
        evaluation_environment.update(
            {
                "EXPERIMENT_DIR": str(evaluation_run),
                "EVALUATION_PROTOCOL": str(PROTOCOL),
                "EVALUATION_BENCHMARK_ID": "timer-simple",
                "EVALUATION_STRATEGY_ID": "protocol-valid",
                "PLC_LAB_INPUT_STRATEGY": "protocol-valid",
                "EVALUATION_REPLICATE_INDEX": "0",
                "EVALUATION_REPLICATE_SEED": "104729",
            }
        )
        subprocess.run(
            [str(REPO_ROOT / "scripts" / "plc-lab"), "experiment"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=evaluation_environment,
        )
        evaluation_manifest = json.loads(
            (evaluation_run / "manifest.json").read_text(encoding="utf-8")
        )
        assert evaluation_manifest["evaluation"]["protocol_id"] == "plc-robustness-comparison-v1"
        assert evaluation_manifest["evaluation"]["replicate_seed"] == 104729
        assert evaluation_manifest["command"][1:3] == ["-s", "104729"]
        evaluation_result = json.loads(
            (evaluation_run / "evaluation-result.json").read_text(encoding="utf-8")
        )
        assert evaluation_result["run_status"] == "success"
        assert all(item["status"] == "pending" for item in evaluation_result["metrics"].values())
        assert all(item["value"] is None for item in evaluation_result["metrics"].values())

        partial_run = root / "partial-evaluation-run"
        partial_environment = dict(launcher_environment)
        partial_environment.update(
            {
                "EXPERIMENT_DIR": str(partial_run),
                "EVALUATION_PROTOCOL": str(PROTOCOL),
            }
        )
        partial = subprocess.run(
            [str(REPO_ROOT / "scripts" / "plc-lab"), "experiment"],
            check=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=partial_environment,
        )
        assert partial.returncode == 2
        assert "must be supplied together" in partial.stderr
        assert not partial_run.exists()

        mismatch_run = root / "mismatch-run"
        mismatch_environment = dict(evaluation_environment)
        mismatch_environment.update(
            {
                "EXPERIMENT_DIR": str(mismatch_run),
                "PLC_LAB_INPUT_STRATEGY": "random-bytes",
            }
        )
        mismatch = subprocess.run(
            [str(REPO_ROOT / "scripts" / "plc-lab"), "experiment"],
            check=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
            env=mismatch_environment,
        )
        assert mismatch.returncode == 2
        assert "must match" in mismatch.stderr
        assert not mismatch_run.exists()

        compatibility_run = root / "compatibility-run"
        compatibility_environment = dict(os.environ)
        compatibility_environment.update(
            {
                "SEED_DIR": str(input_samples),
                "FINDINGS_DIR": str(root / "compatibility-observations"),
                "EXPERIMENT_DIR": str(compatibility_run),
                "AFL_GRAMMAR": str(grammar),
                "AFL_CUSTOM_MUTATOR_LIBRARY": str(input_transformer),
                "FUZZ_TARGET": str(target),
                "AFL_FUZZ_BINARY": str(VERSION_TOOL),
                "FUZZ_DURATION": "10",
                "FUZZ_TIMEOUT": "1000",
            }
        )
        compatibility = subprocess.run(
            [str(REPO_ROOT / "scripts" / "plcfuzz"), "experiment"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            env=compatibility_environment,
        )
        assert "Deprecated compatibility command" in compatibility.stderr
        assert "use INPUT_SAMPLES_DIR" in compatibility.stderr
        assert "use OBSERVATIONS_DIR" in compatibility.stderr
        assert "use INSTRUMENTED_TARGET" in compatibility.stderr
        assert "use AUTOMATED_INPUT_TOOL" in compatibility.stderr
        assert "use EXPERIMENT_DURATION" in compatibility.stderr
        assert "use EXECUTION_TIMEOUT" in compatibility.stderr
        assert (compatibility_run / "manifest.json").is_file()


if __name__ == "__main__":
    main()
