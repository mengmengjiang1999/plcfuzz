#!/usr/bin/env python3
"""Validate the repository's aggregate SPDX license metadata boundary."""

import glob
import json
import pathlib
import re
import subprocess
import sys


REQUIRED_ORIGINAL_PATHS = {
    "README.md",
    "docs/LICENSE_METADATA.md",
    "docs/EVALUATION_PROTOCOL.md",
    "docs/BENCHMARK_SUITE.md",
    "docs/BASELINE_COMPARISON.md",
    "docs/EXPERIMENT_REPORTS.md",
    "docs/PROJECT_CODE_COVERAGE.md",
    "docs/OFFLINE_RUNTIME_ARCHITECTURE.md",
    "benchmarks/manifest-v1.json",
    "evaluation/protocol-v1.json",
    "input_generation/plc_input_transformer.cpp",
    "include/plc_input_format.h",
    "runfuzz.sh",
    "scripts/check_license_metadata.py",
    "scripts/evaluation_protocol.py",
    "scripts/check_benchmark_suite.py",
    "scripts/comparison_plan.py",
    "scripts/check_comparison_workflow.sh",
    "scripts/experiment_report.py",
    "scripts/coverage_report.py",
    "scripts/run_project_coverage.sh",
    "coverage/scope-v1.json",
    "coverage/baseline-v1.json",
    "scripts/check_report_workflow.sh",
    "scripts/generate_benchmark_suite.py",
    "src/plc_input_simulator.cpp",
    "static_analyse/main.py",
    "tests/plc_input_transformer_test.cpp",
    "tests/evaluation_protocol_test.py",
    "tests/benchmark_suite_test.py",
    "tests/comparison_plan_test.py",
    "tests/experiment_report_test.py",
    "tests/coverage_report_test.py",
}
OPENSPEC_METADATA_PATHS = {
    "openspec/changes/add-license-metadata/specs/project-license-metadata/spec.md",
    "openspec/specs/project-license-metadata/spec.md",
}
INHERITED_PATHS = {
    "include/ladder.h",
    "include/modbus_runtime_internal.h",
    "lib/iec_std_functions.h",
    "lib/iec_types_all.h",
    "src/hardware_layer.cpp",
    "src/main.cpp",
    "src/modbus.cpp",
    "src/modbus_discrete.cpp",
    "src/modbus_registers.cpp",
    "src/offline_runtime.cpp",
    "src/runtime_buffer_map.cpp",
}
PRESERVED_NOTICES = {
    "include/modbus_runtime_internal.h": "Copyright 2015 Thiago Alves",
    "src/main.cpp": "Copyright 2018 Thiago Alves",
    "src/hardware_layer.cpp": "Copyright 2015 Thiago Alves",
    "src/modbus.cpp": "Copyright 2015 Thiago Alves",
    "src/modbus_discrete.cpp": "Copyright 2015 Thiago Alves",
    "src/modbus_registers.cpp": "Copyright 2015 Thiago Alves",
    "src/offline_runtime.cpp": "Copyright 2018 Thiago Alves",
    "src/runtime_buffer_map.cpp": "Copyright 2015 Thiago Alves",
    "lib/iec_std_functions.h": "copyright 2008 Edouard TISSERANT",
    "lib/iec_types_all.h": "Copyright (C) 2007-2011",
}


def fail(message):
    print("License metadata check failed: {}".format(message), file=sys.stderr)
    raise SystemExit(1)


def tracked_paths(repo_root):
    try:
        output = subprocess.check_output(
            ["git", "-C", str(repo_root), "ls-files", "--cached", "--others", "--exclude-standard", "-z"],
            stderr=subprocess.DEVNULL,
        )
    except (FileNotFoundError, subprocess.CalledProcessError):
        excluded_roots = {
            ".git",
            "build",
            "findings",
            "findings_back",
            "input_samples",
            "observations",
            "openplc",
            "openplc_instrumented",
            "output",
            "plclogic",
            "results",
            "seeds",
            "third_party",
        }
        return {
            path.relative_to(repo_root).as_posix()
            for path in repo_root.rglob("*")
            if path.is_file() and path.relative_to(repo_root).parts[0] not in excluded_roots
        }
    return {item.decode("utf-8") for item in output.split(b"\0") if item}


def parse_metadata(path):
    text = path.read_text(encoding="utf-8")
    if not re.search(r"(?m)^version\s*=\s*1\s*$", text):
        fail("REUSE.toml must declare version 1")
    blocks = text.split("[[annotations]]")
    if len(blocks) < 2:
        fail("at least one aggregate annotation is required")
    project_patterns = []
    annotation_patterns = []
    for block in blocks[1:]:
        path_match = re.search(r"(?ms)^path\s*=\s*(\[.*?\])\s*$", block)
        if path_match is None:
            fail("annotation path list is missing")
        try:
            patterns = json.loads(path_match.group(1))
        except json.JSONDecodeError as error:
            fail("annotation path list is invalid: {}".format(error))
        annotation_patterns.append(patterns)
        fields = {}
        for name in ("precedence", "SPDX-FileCopyrightText", "SPDX-License-Identifier"):
            match = re.search(r'(?m)^{}\s*=\s*"([^"]+)"\s*$'.format(re.escape(name)), block)
            if match is None:
                fail("annotation field is missing: " + name)
            fields[name] = match.group(1)
        if fields["precedence"] != "aggregate":
            fail("annotation precedence must be aggregate")
        if fields["SPDX-License-Identifier"] not in {"GPL-3.0-only", "GPL-3.0-or-later"}:
            fail("annotation uses an unsupported license identifier")
        if fields["SPDX-FileCopyrightText"] == "2024-2026 PLC Robustness Lab contributors":
            if fields["SPDX-License-Identifier"] != "GPL-3.0-only":
                fail("project-authored annotation must use GPL-3.0-only")
            project_patterns.extend(patterns)
    if not project_patterns:
        fail("project-authored aggregate annotation is missing")
    return project_patterns, annotation_patterns


def expand_patterns(repo_root, patterns, tracked):
    covered = set()
    for pattern in patterns:
        matches = {
            pathlib.Path(value).relative_to(repo_root).as_posix()
            for value in glob.glob(str(repo_root / pattern), recursive=True)
            if pathlib.Path(value).is_file()
        }
        untracked_matches = matches - tracked
        if untracked_matches:
            fail(
                "annotation pattern includes untracked paths: {}".format(
                    ", ".join(sorted(untracked_matches))
                )
            )
        tracked_matches = matches & tracked
        if not tracked_matches:
            fail("annotation pattern matches no tracked file: {}".format(pattern))
        covered.update(tracked_matches)
    return covered


def main():
    repo_root = pathlib.Path(__file__).resolve().parents[1]
    tracked = tracked_paths(repo_root)
    patterns, annotation_patterns = parse_metadata(repo_root / "REUSE.toml")
    for annotated_group in annotation_patterns:
        expand_patterns(repo_root, annotated_group, tracked)
    covered = expand_patterns(repo_root, patterns, tracked)

    missing = REQUIRED_ORIGINAL_PATHS - covered
    if missing:
        fail("required original paths are uncovered: {}".format(", ".join(sorted(missing))))
    if not (OPENSPEC_METADATA_PATHS & covered):
        fail("the active or archived license-metadata specification is uncovered")
    overlap = INHERITED_PATHS & covered
    if overlap:
        fail("inherited paths are covered as original: {}".format(", ".join(sorted(overlap))))

    license_text = (repo_root / "LICENSE").read_text(encoding="utf-8")
    if "GNU GENERAL PUBLIC LICENSE" not in license_text or "Version 3, 29 June 2007" not in license_text:
        fail("top-level LICENSE is not the complete GPL version 3 text")
    for relative_path, notice in PRESERVED_NOTICES.items():
        content = (repo_root / relative_path).read_text(encoding="utf-8", errors="replace")
        if notice not in content:
            fail("upstream notice is missing from {}".format(relative_path))

    print("PASS license metadata")


if __name__ == "__main__":
    main()
