#!/usr/bin/env python3
"""Generate and validate project-scoped coverage summaries."""

import argparse
import hashlib
import json
import math
from pathlib import Path
import sys


SCOPE_SCHEMA = "plc-lab-project-coverage-scope-v1"
BASELINE_SCHEMA = "plc-lab-project-coverage-baseline-v1"
SUMMARY_SCHEMA = "plc-lab-project-coverage-summary-v1"


class CoverageReportError(ValueError):
    pass


def require(condition, message):
    if not condition:
        raise CoverageReportError(message)


def canonical_sha256(value):
    encoded = json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def load_json(path):
    try:
        return json.loads(Path(path).read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise CoverageReportError("cannot read {}: {}".format(path, error))


def validate_scope(scope, repo_root):
    require(isinstance(scope, dict), "scope must be an object")
    require(set(scope) == {"schema", "cpp_sources", "python_sources", "excluded_paths"}, "scope fields differ")
    require(scope["schema"] == SCOPE_SCHEMA, "scope schema differs")
    for key, suffix in (("cpp_sources", (".cpp", ".h")), ("python_sources", (".py",))):
        values = scope[key]
        require(isinstance(values, list) and values == sorted(set(values)) and values, key + " must be sorted and unique")
        for relative in values:
            require(isinstance(relative, str) and relative.endswith(suffix), "invalid source path: " + str(relative))
            require(".." not in Path(relative).parts and not Path(relative).is_absolute(), "source path escapes repository")
            require((repo_root / relative).is_file(), "scope source is missing: " + relative)
    excluded = scope["excluded_paths"]
    require(isinstance(excluded, list) and excluded == sorted(set(excluded)) and excluded, "excluded_paths must be sorted and unique")
    require("third_party/" in excluded and "plclogic/" in excluded and "src/glueVars.cpp" in excluded,
            "required third-party and generated exclusions are missing")
    return canonical_sha256(scope)


def validate_baseline(baseline, scope_digest):
    require(isinstance(baseline, dict), "baseline must be an object")
    required = {"schema", "scope_schema", "scope_sha256", "enforcement", "environment", "cpp", "python", "note"}
    require(set(baseline) == required, "baseline fields differ")
    require(baseline["schema"] == BASELINE_SCHEMA, "baseline schema differs")
    require(baseline["scope_schema"] == SCOPE_SCHEMA, "baseline scope schema differs")
    require(baseline["scope_sha256"] == scope_digest, "baseline scope digest differs")
    require(baseline["enforcement"] in {"report-only", "minimum"}, "invalid baseline enforcement")
    for language in ("cpp", "python"):
        record = baseline[language]
        require(isinstance(record, dict) and set(record) == {"line_percent"}, "invalid baseline language record")
        value = record["line_percent"]
        require(isinstance(value, (int, float)) and math.isfinite(value) and 0.0 <= value <= 100.0,
                "invalid baseline percentage")


def scoped_relative(source, repo_root, allowed):
    source = Path(source)
    if not source.is_absolute():
        source = repo_root / source
    try:
        relative = source.resolve().relative_to(repo_root.resolve()).as_posix()
        if relative in allowed:
            return relative
    except ValueError:
        pass
    normalized = source.as_posix()
    matches = [candidate for candidate in allowed if normalized.endswith("/" + candidate)]
    require(len(matches) <= 1, "coverage source path matches multiple scope entries: " + normalized)
    return matches[0] if matches else None


def parse_lcov(path, repo_root, allowed):
    files = {}
    current = None
    for raw_line in Path(path).read_text(encoding="utf-8").splitlines():
        if raw_line.startswith("SF:"):
            relative = scoped_relative(raw_line[3:], repo_root, allowed)
            require(relative is not None, "C++ report contains out-of-scope file: " + raw_line[3:])
            current = files.setdefault(relative, {"lines_found": 0, "lines_hit": 0})
        elif raw_line.startswith("LF:"):
            require(current is not None, "LCOV LF record has no source")
            current["lines_found"] = int(raw_line[3:])
        elif raw_line.startswith("LH:"):
            require(current is not None, "LCOV LH record has no source")
            current["lines_hit"] = int(raw_line[3:])
    require(files, "C++ report contains no scoped files")
    return files


def parse_python(path, repo_root, allowed):
    report = load_json(path)
    require(isinstance(report.get("files"), dict), "Python coverage JSON has no files")
    files = {}
    for source, record in report["files"].items():
        relative = scoped_relative(source, repo_root, allowed)
        if relative is None:
            continue
        summary = record.get("summary", {})
        files[relative] = {
            "lines_found": int(summary.get("num_statements", 0)),
            "lines_hit": int(summary.get("covered_lines", 0)),
        }
    require(files, "Python report contains no scoped files")
    return files


def language_summary(files, baseline_value):
    found = sum(item["lines_found"] for item in files.values())
    hit = sum(item["lines_hit"] for item in files.values())
    require(found > 0 and 0 <= hit <= found, "invalid line totals")
    percent = round(100.0 * hit / found, 2)
    return {
        "files": {name: files[name] for name in sorted(files)},
        "lines_found": found,
        "lines_hit": hit,
        "line_percent": percent,
        "baseline_percent": baseline_value,
        "difference_points": round(percent - baseline_value, 2),
    }


def atomic_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def generate(args):
    repo_root = args.repo_root.resolve()
    scope = load_json(args.scope)
    scope_digest = validate_scope(scope, repo_root)
    baseline = load_json(args.baseline)
    validate_baseline(baseline, scope_digest)
    integration = load_json(args.integration)
    require(integration == {"invalid_input": "passed", "missing_argument": "passed", "valid_input": "passed",
                            "variable_map_command": "passed"}, "integration outcomes are incomplete")
    cpp_files = parse_lcov(args.cpp_info, repo_root, set(scope["cpp_sources"]))
    python_files = parse_python(args.python_json, repo_root, set(scope["python_sources"]))
    summary = {
        "schema": SUMMARY_SCHEMA,
        "scope": {"path": args.scope.resolve().relative_to(repo_root).as_posix(), "sha256": scope_digest},
        "baseline": {"path": args.baseline.resolve().relative_to(repo_root).as_posix(),
                     "enforcement": baseline["enforcement"]},
        "cpp": language_summary(cpp_files, baseline["cpp"]["line_percent"]),
        "python": language_summary(python_files, baseline["python"]["line_percent"]),
        "excluded_paths": scope["excluded_paths"],
        "integration_checks": integration,
        "artifacts": ["cpp-html/index.html", "cpp.info", "python-html/index.html", "python.json", "python.xml"],
    }
    atomic_json(args.output, summary)
    validate_summary(summary, args.output.parent, repo_root, scope, baseline)
    print("Wrote project coverage summary to {}".format(args.output))


def validate_summary(summary, report_dir, repo_root, scope, baseline):
    require(summary.get("schema") == SUMMARY_SCHEMA, "summary schema differs")
    scope_digest = validate_scope(scope, repo_root)
    validate_baseline(baseline, scope_digest)
    require(summary.get("scope", {}).get("sha256") == scope_digest, "summary scope digest differs")
    require(summary.get("baseline", {}).get("enforcement") == baseline["enforcement"], "summary enforcement differs")
    require(summary.get("excluded_paths") == scope["excluded_paths"], "summary exclusions differ")
    for language, allowed in (("cpp", set(scope["cpp_sources"])), ("python", set(scope["python_sources"]))):
        record = summary.get(language, {})
        files = record.get("files", {})
        require(files and set(files).issubset(allowed), language + " summary scope differs")
        found = sum(item["lines_found"] for item in files.values())
        hit = sum(item["lines_hit"] for item in files.values())
        require(record.get("lines_found") == found and record.get("lines_hit") == hit, language + " totals differ")
        require(record.get("line_percent") == round(100.0 * hit / found, 2), language + " percentage differs")
        expected_difference = round(record["line_percent"] - baseline[language]["line_percent"], 2)
        require(record.get("difference_points") == expected_difference, language + " baseline difference differs")
        if baseline["enforcement"] == "minimum":
            require(record["line_percent"] >= baseline[language]["line_percent"], language + " coverage is below baseline")
    required_outcomes = {"invalid_input", "missing_argument", "valid_input", "variable_map_command"}
    checks = summary.get("integration_checks", {})
    require(set(checks) == required_outcomes and all(value == "passed" for value in checks.values()),
            "integration checks are incomplete")
    artifacts = summary.get("artifacts")
    require(isinstance(artifacts, list) and artifacts == sorted(set(artifacts)), "artifact inventory must be sorted and unique")
    for relative in artifacts:
        require(".." not in Path(relative).parts and (report_dir / relative).is_file(), "coverage artifact is missing: " + relative)


def validate(args):
    repo_root = args.repo_root.resolve()
    scope = load_json(args.scope)
    baseline = load_json(args.baseline)
    summary = load_json(args.summary)
    validate_summary(summary, args.summary.parent, repo_root, scope, baseline)
    print("PASS project coverage report")


def parser():
    repo_root = Path(__file__).resolve().parents[1]
    result = argparse.ArgumentParser(description=__doc__)
    subcommands = result.add_subparsers(dest="command", required=True)
    generate_parser = subcommands.add_parser("generate", help="build a summary from language reports")
    generate_parser.add_argument("--cpp-info", type=Path, required=True)
    generate_parser.add_argument("--python-json", type=Path, required=True)
    generate_parser.add_argument("--integration", type=Path, required=True)
    generate_parser.add_argument("--output", type=Path, required=True)
    validate_parser = subcommands.add_parser("validate", help="validate a complete report bundle")
    validate_parser.add_argument("summary", type=Path)
    for command_parser in (generate_parser, validate_parser):
        command_parser.add_argument("--repo-root", type=Path, default=repo_root)
        command_parser.add_argument("--scope", type=Path, default=repo_root / "coverage/scope-v1.json")
        command_parser.add_argument("--baseline", type=Path, default=repo_root / "coverage/baseline-v1.json")
    return result


def main():
    args = parser().parse_args()
    try:
        if args.command == "generate":
            generate(args)
        else:
            validate(args)
    except (CoverageReportError, OSError, ValueError) as error:
        print("Coverage report error: {}".format(error), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
