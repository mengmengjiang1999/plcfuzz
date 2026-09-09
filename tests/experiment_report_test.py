#!/usr/bin/env python3
"""Exercise deterministic experiment report generation and validation."""

import importlib.util
import json
import pathlib
import shutil
import sys
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO_ROOT / "scripts"))
import evaluation_protocol

SPEC = importlib.util.spec_from_file_location(
    "experiment_report", REPO_ROOT / "scripts" / "experiment_report.py"
)
REPORT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(REPORT)
PROTOCOL_PATH = REPO_ROOT / "evaluation" / "protocol-v1.json"


def write_run(root, name, value_offset, run_status="success", pending=False, observation=False):
    run_dir = root / name
    run_dir.mkdir(parents=True)
    protocol = evaluation_protocol.load_json(PROTOCOL_PATH)
    checksum = evaluation_protocol.sha256_file(PROTOCOL_PATH)
    evaluation = {
        "protocol_id": protocol["protocol_id"],
        "protocol_version": protocol["protocol_version"],
        "protocol_path": str(PROTOCOL_PATH),
        "protocol_sha256": checksum,
        "benchmark_id": "timer-simple",
        "strategy_id": "structure-aware",
        "replicate_index": value_offset - 1,
        "replicate_seed": protocol["repeated_trials"]["seeds"][value_offset - 1],
        "result": "evaluation-result.json",
    }
    manifest = {
        "schema": "PLC_LAB_EXPERIMENT_MANIFEST_V1",
        "status": run_status,
        "exit_code": 0 if run_status == "success" else 2,
        "repository_commit": "1" * 40,
        "matiec_commit": "2" * 40,
        "input_tool_version": "fixture 1",
        "target_sha256": "3" * 64,
        "duration_seconds": 60,
        "timeout_milliseconds": 1000,
        "input_samples_dir": "/fixture/input-samples",
        "machine": {"system": "FixtureOS", "machine": "fixture", "cpu_count": 2},
        "environment": {"PLC_LAB_CYCLE_COUNT": "100", "PLC_LAB_CYCLE_DELAY_NS": "0"},
        "evaluation": evaluation,
    }
    (run_dir / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    result = evaluation_protocol.create_result_template(protocol, evaluation)
    result["run_status"] = run_status
    if not pending:
        values = {
            "valid_input_ratio": value_offset / 4.0,
            "path_coverage_delta": value_offset,
            "plc_state_transition_count": value_offset + 1,
            "unique_observation_count": value_offset,
            "time_to_first_observation_seconds": float(value_offset),
            "replay_success_ratio": 1.0,
        }
        for metric_id, value in values.items():
            result["metrics"][metric_id].update(
                {"status": "complete", "value": value, "reason": None, "evidence": ["metrics.json"]}
            )
    if observation:
        sample = run_dir / "replay" / "sample.txt"
        sample.parent.mkdir()
        sample.write_text("fixture\n", encoding="utf-8")
        result["observations"] = [
            {"stable_digest": "a" * 64, "replay_sample": "replay/sample.txt"}
        ]
    evaluation_protocol.validate_result(result, protocol, checksum)
    (run_dir / "evaluation-result.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


def expect_invalid(function, fragment):
    try:
        function()
    except ValueError as error:
        assert fragment in str(error), str(error)
    else:
        raise AssertionError("expected report validation failure")


def main():
    with tempfile.TemporaryDirectory(prefix="plc-lab-report-test-") as temporary:
        root = pathlib.Path(temporary)
        input_root = root / "runs"
        write_run(input_root, "run-1", 1, observation=True)
        write_run(input_root, "run-2", 2, observation=True)
        write_run(input_root, "run-3", 3, run_status="nonzero", pending=True)
        output = root / "report"
        REPORT.generate(input_root, output)
        report = REPORT.validate_report(output)
        assert report["run_count"] == 3
        assert len(report["aggregates"]) == 6
        assert len(report["failed_runs"]) == 1
        assert len(report["missing_metrics"]) == 6
        assert len(report["observations"]) == 1
        assert len(report["observations"][0]["sources"]) == 2
        coverage = next(
            item for item in report["aggregates"] if item["metric_id"] == "path_coverage_delta"
        )
        assert coverage["values"] == [1, 2]
        assert coverage["mean"] == 1.5
        assert coverage["median"] == 1.5
        assert coverage["interval_95"] == [1.0, 2.0]
        expect_invalid(lambda: REPORT.generate(input_root, output), "not empty")

        broken = root / "broken-report"
        shutil.copytree(output, broken)
        (broken / report["artifacts"]["charts"][0]).unlink()
        expect_invalid(lambda: REPORT.validate_report(broken), "chart is missing")

        invalid_result = json.loads(
            (input_root / "run-1" / "evaluation-result.json").read_text(encoding="utf-8")
        )
        invalid_result["observations"][0]["replay_sample"] = "../outside.txt"
        expect_invalid(
            lambda: evaluation_protocol.validate_result(
                invalid_result, evaluation_protocol.load_json(PROTOCOL_PATH),
                evaluation_protocol.sha256_file(PROTOCOL_PATH),
            ),
            "escapes",
        )


if __name__ == "__main__":
    main()
