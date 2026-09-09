#!/usr/bin/env python3
"""Exercise evaluation protocol and result validation."""

import copy
import importlib.util
import json
import pathlib
import subprocess
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
HELPER = REPO_ROOT / "scripts" / "evaluation_protocol.py"
PROTOCOL_PATH = REPO_ROOT / "evaluation" / "protocol-v1.json"
SPEC = importlib.util.spec_from_file_location("evaluation_protocol", HELPER)
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


def expect_invalid(function, fragment):
    try:
        function()
    except ValueError as error:
        assert fragment in str(error), str(error)
    else:
        raise AssertionError("expected ValueError containing {!r}".format(fragment))


def main():
    protocol = MODULE.validate_protocol(MODULE.load_json(PROTOCOL_PATH))
    assert {metric["id"] for metric in protocol["metrics"]} == (
        MODULE.TRIAL_METRICS | MODULE.AGGREGATE_METRICS
    )
    protocol, context = MODULE.evaluation_context(
        PROTOCOL_PATH, "timer-simple", "protocol-valid", 0, 104729
    )
    expect_invalid(
        lambda: MODULE.evaluation_context(
            PROTOCOL_PATH, "timer-simple", "protocol-valid", 0, 130363
        ),
        "does not match",
    )
    expect_invalid(
        lambda: MODULE.evaluation_context(
            PROTOCOL_PATH, "timer-simple", "protocol-valid", 99, 104729
        ),
        "outside",
    )

    template = MODULE.create_result_template(protocol, context)
    MODULE.validate_result(template, protocol, context["protocol_sha256"])
    complete = copy.deepcopy(template)
    values = {
        "valid_input_ratio": 0.8,
        "path_coverage_delta": 14,
        "plc_state_transition_count": 7,
        "unique_observation_count": 3,
        "time_to_first_observation_seconds": 1.25,
        "replay_success_ratio": 1.0,
    }
    for metric_id, value in values.items():
        complete["metrics"][metric_id].update(
            {"status": "complete", "value": value, "reason": None, "evidence": ["metrics/source.json"]}
        )
    MODULE.validate_result(complete, protocol, context["protocol_sha256"])

    invalid_ratio = copy.deepcopy(complete)
    invalid_ratio["metrics"]["valid_input_ratio"]["value"] = 1.1
    expect_invalid(lambda: MODULE.validate_result(invalid_ratio, protocol), "upper bound")
    missing_evidence = copy.deepcopy(complete)
    missing_evidence["metrics"]["path_coverage_delta"]["evidence"] = []
    expect_invalid(lambda: MODULE.validate_result(missing_evidence, protocol), "needs evidence")
    pending_value = copy.deepcopy(template)
    pending_value["metrics"]["unique_observation_count"]["value"] = 0
    expect_invalid(lambda: MODULE.validate_result(pending_value, protocol), "must use null")
    missing_metric = copy.deepcopy(template)
    del missing_metric["metrics"]["replay_success_ratio"]
    expect_invalid(lambda: MODULE.validate_result(missing_metric, protocol), "exactly the six")
    aggregate_in_trial = copy.deepcopy(template)
    aggregate_in_trial["metrics"]["replicate_variability"] = {}
    expect_invalid(lambda: MODULE.validate_result(aggregate_in_trial, protocol), "exactly the six")

    subprocess.run(["python3", str(HELPER), "validate-protocol"], check=True)
    with tempfile.TemporaryDirectory(prefix="plc-lab-evaluation-test-") as temporary:
        result_path = pathlib.Path(temporary) / "result.json"
        subprocess.run(
            [
                "python3", str(HELPER), "template",
                "--benchmark-id", "timer-simple",
                "--strategy-id", "protocol-valid",
                "--replicate-index", "0",
                "--replicate-seed", "104729",
                "--output", str(result_path),
            ],
            check=True,
        )
        result = json.loads(result_path.read_text(encoding="utf-8"))
        assert result["schema"] == MODULE.RESULT_SCHEMA
        subprocess.run(
            ["python3", str(HELPER), "validate-result", str(result_path)],
            check=True,
        )


if __name__ == "__main__":
    main()
