#!/usr/bin/env python3
"""Exercise project-scoped coverage summary generation and validation."""

import copy
import importlib.util
import json
from pathlib import Path
import tempfile


REPO_ROOT = Path(__file__).resolve().parent.parent
SPEC = importlib.util.spec_from_file_location("plc_lab_coverage_report", REPO_ROOT / "scripts/coverage_report.py")
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value), encoding="utf-8")


def expect_invalid(callback, message):
    try:
        callback()
    except MODULE.CoverageReportError as error:
        assert message in str(error), str(error)
    else:
        raise AssertionError("invalid coverage record was accepted")


def main():
    with tempfile.TemporaryDirectory(prefix="plc-lab-coverage-test-") as directory:
        root = Path(directory)
        (root / "src").mkdir()
        (root / "scripts").mkdir()
        (root / "src/unit.cpp").write_text("int value() { return 1; }\n", encoding="utf-8")
        (root / "scripts/tool.py").write_text("def value():\n    return 1\n", encoding="utf-8")
        scope = {
            "schema": MODULE.SCOPE_SCHEMA,
            "cpp_sources": ["src/unit.cpp"],
            "python_sources": ["scripts/tool.py"],
            "excluded_paths": ["build/", "lib/", "output/", "plclogic/", "src/glueVars.cpp", "third_party/"],
        }
        scope_path = root / "coverage/scope-v1.json"
        write_json(scope_path, scope)
        digest = MODULE.canonical_sha256(scope)
        baseline = {
            "schema": MODULE.BASELINE_SCHEMA,
            "scope_schema": MODULE.SCOPE_SCHEMA,
            "scope_sha256": digest,
            "enforcement": "report-only",
            "environment": "test",
            "cpp": {"line_percent": 50.0},
            "python": {"line_percent": 80.0},
            "note": "fixture",
        }
        baseline_path = root / "coverage/baseline-v1.json"
        write_json(baseline_path, baseline)
        report_dir = root / "report"
        for artifact in ("cpp-html/index.html", "python-html/index.html", "python.xml"):
            path = report_dir / artifact
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("fixture", encoding="utf-8")
        cpp_info = report_dir / "cpp.info"
        cpp_info.write_text("SF:{}\nLF:4\nLH:3\nend_of_record\n".format(root / "src/unit.cpp"), encoding="utf-8")
        python_json = report_dir / "python.json"
        write_json(python_json, {"files": {str(root / "scripts/tool.py"): {
            "summary": {"num_statements": 5, "covered_lines": 4}
        }}})
        integration = root / "integration.json"
        write_json(integration, {
            "invalid_input": "passed",
            "missing_argument": "passed",
            "valid_input": "passed",
            "variable_map_command": "passed",
        })
        output = report_dir / "summary.json"
        args = type("Args", (), {
            "repo_root": root, "scope": scope_path, "baseline": baseline_path,
            "cpp_info": cpp_info, "python_json": python_json,
            "integration": integration, "output": output,
        })()
        MODULE.generate(args)
        summary = json.loads(output.read_text(encoding="utf-8"))
        assert summary["cpp"]["line_percent"] == 75.0
        assert summary["python"]["line_percent"] == 80.0
        assert summary["cpp"]["difference_points"] == 25.0
        MODULE.validate_summary(summary, report_dir, root, scope, baseline)

        wrong_scope = copy.deepcopy(scope)
        wrong_scope["cpp_sources"] = ["src/missing.cpp"]
        expect_invalid(lambda: MODULE.validate_scope(wrong_scope, root), "scope source is missing")
        out_of_scope = report_dir / "outside.info"
        out_of_scope.write_text("SF:{}\nLF:1\nLH:1\n".format(root / "outside.cpp"), encoding="utf-8")
        expect_invalid(lambda: MODULE.parse_lcov(out_of_scope, root, {"src/unit.cpp"}), "out-of-scope")
        missing_artifact = copy.deepcopy(summary)
        missing_artifact["artifacts"].append("missing.txt")
        missing_artifact["artifacts"].sort()
        expect_invalid(lambda: MODULE.validate_summary(missing_artifact, report_dir, root, scope, baseline),
                       "artifact is missing")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
