#!/usr/bin/env python3
"""Exercise controlled comparison-plan generation and validation."""

import copy
import importlib.util
import json
import pathlib
import subprocess
import sys
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
HELPER = REPO_ROOT / "scripts" / "comparison_plan.py"
sys.path.insert(0, str(REPO_ROOT / "scripts"))
SPEC = importlib.util.spec_from_file_location("comparison_plan", HELPER)
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


def expect_invalid(document, fragment):
    try:
        MODULE.validate_plan_document(document)
    except ValueError as error:
        assert fragment in str(error), str(error)
    else:
        raise AssertionError("expected invalid comparison plan")


def main():
    registry = MODULE.validate_registry(
        json.loads((REPO_ROOT / "evaluation" / "strategies-v1.json").read_text(encoding="utf-8"))
    )
    assert tuple(item for item in MODULE.MAINTAINED_STRATEGIES) == (
        "random-bytes", "protocol-valid", "structure-aware"
    )
    assert registry["state-feedback"]["availability"] == "adapter-required"
    with tempfile.TemporaryDirectory(prefix="plc-lab-comparison-test-") as temporary:
        root = pathlib.Path(temporary)
        plan_path = root / "core-plan.json"
        subprocess.run(
            ["python3", str(HELPER), "generate", "--output", str(plan_path)], check=True
        )
        plan = json.loads(plan_path.read_text(encoding="utf-8"))
        assert len(plan["benchmarks"]) == 15
        assert len(plan["strategies"]) == 3
        assert len(plan["trials"]) == 225
        MODULE.validate_plan_document(plan)
        subprocess.run(["python3", str(HELPER), "validate", str(plan_path)], check=True)

        incomplete = copy.deepcopy(plan)
        incomplete["trials"].pop()
        expect_invalid(incomplete, "paired-seed coverage")
        duplicate = copy.deepcopy(plan)
        duplicate["trials"][-1] = duplicate["trials"][0]
        expect_invalid(duplicate, "duplicate comparison trial")
        stale = copy.deepcopy(plan)
        stale["protocol"]["sha256"] = "0" * 64
        expect_invalid(stale, "protocol checksum differs")

        shown = subprocess.run(
            [
                "python3", str(HELPER), "run", str(plan_path),
                "--trial-id", "timer-simple--random-bytes--r0", "--print-only",
            ],
            check=True, stdout=subprocess.PIPE, text=True,
        )
        shown_document = json.loads(shown.stdout[shown.stdout.index("{"):])
        assert shown_document["trial"]["replicate_seed"] == 104729

        missing_optional = subprocess.run(
            [
                "python3", str(HELPER), "generate", "--output", str(root / "optional.json"),
                "--state-feedback-adapter", str(root / "missing.so"),
            ],
            check=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True,
        )
        assert missing_optional.returncode == 2
        assert "does not exist" in missing_optional.stderr


if __name__ == "__main__":
    main()
