#!/usr/bin/env python3
"""Validate representative benchmark metadata, replay data, and compilation."""

import argparse
import hashlib
import json
import os
import pathlib
import re
import subprocess
import tempfile


CATALOG_SCHEMA = "PLC_LAB_BENCHMARK_CATALOG_V1"
TRACE_SCHEMA = "PLC_LAB_BENCHMARK_TRACE_V1"
CATEGORIES = {"timer", "counter", "state-machine", "interlock", "sequential-control"}
LEVELS = {"simple", "general", "complex"}
CASE_FIELDS = {
    "id", "category", "complexity", "profile", "source", "source_sha256",
    "inputs", "outputs", "modeled_state_count", "expected_behavior", "origin",
    "replay", "expected_trace",
}
VARIABLE_FIELDS = {"name", "address", "type"}
LOCATED_PATTERN = re.compile(
    r"^\s*([A-Za-z][A-Za-z0-9_]*)\s+AT\s+(%[IQ][XWDL][0-9.]+)\s*:\s*([A-Za-z][A-Za-z0-9_]*)\s*;",
    re.MULTILINE,
)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256_file(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def checked_path(repo_root, value, prefix):
    require(isinstance(value, str) and value, "path is missing")
    relative = pathlib.PurePosixPath(value)
    require(not relative.is_absolute() and ".." not in relative.parts, "path escapes repository: " + value)
    require(relative.parts and relative.parts[0] == prefix, "path must be below {}: {}".format(prefix, value))
    resolved = repo_root / relative
    require(resolved.is_file(), "file does not exist: " + value)
    return resolved


def parse_replay(path):
    tokens = path.read_text(encoding="utf-8").split()
    require(tokens and tokens[0] == "PLCFUZZ_INPUT_V1", "replay must use the V1 header: " + str(path))
    numbers = tokens[1:]
    require(numbers and len(numbers) % 119 == 0, "replay records must contain 119 fields: " + str(path))
    records = []
    limits = ([2147483647] + [255] * 64 + [2147483647] + [255] * 8 +
              [2147483647] + [65535] * 8 + [2147483647] + [4294967295] * 8 +
              [2147483647] + [18446744073709551615] * 8 +
              [2147483647] + [65535] * 8 + [2147483647] + [4294967295] * 8)
    require(len(limits) == 119, "internal replay layout is invalid")
    for offset in range(0, len(numbers), 119):
        record = []
        for index, token in enumerate(numbers[offset:offset + 119]):
            require(token.isdigit(), "replay field is not unsigned decimal: " + token)
            value = int(token)
            require(value <= limits[index], "replay field exceeds its type bound")
            record.append(value)
        records.append(record)
    return records


def source_variables(path):
    values = []
    for name, address, value_type in LOCATED_PATTERN.findall(path.read_text(encoding="utf-8")):
        values.append({"name": name, "address": address, "type": value_type})
    return values


def testcase_catalog_paths(repo_root):
    lines = (repo_root / "testcases" / "manifest.tsv").read_text(encoding="utf-8").splitlines()
    require(len(lines) >= 2 and lines[0] == "# plc-lab-testcase-catalog-v1", "testcase catalog marker is invalid")
    return {line.split("\t", 1)[0] for line in lines[2:] if line}


def generated_digests(directory):
    return {
        path.relative_to(directory).as_posix(): sha256_file(path)
        for path in directory.rglob("*")
        if path.is_file()
    }


def verify_compiler(repo_root, cases):
    compiler = pathlib.Path(os.environ.get("MATIEC_IEC2C", repo_root / "third_party/matiec/iec2c"))
    include_dir = pathlib.Path(os.environ.get("MATIEC_INCLUDE_DIR", repo_root / "third_party/matiec/lib"))
    require(compiler.is_file() and os.access(str(compiler), os.X_OK), "MatIEC compiler is missing: " + str(compiler))
    with tempfile.TemporaryDirectory(prefix="plc-lab-benchmarks-") as temporary:
        root = pathlib.Path(temporary)
        for case in cases:
            snapshots = []
            for repetition in range(2):
                output = root / case["id"] / str(repetition)
                output.mkdir(parents=True)
                command = [
                    str(compiler), "--std=legacy", "-f", "-l", "-p",
                    "-I", str(include_dir), "-T", str(output), str(repo_root / case["source"]),
                ]
                result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
                require(result.returncode == 0, "{} compiler verification failed: {}".format(case["id"], result.stderr.strip()))
                snapshots.append(generated_digests(output))
            require(snapshots[0] == snapshots[1], "{} generated output is not deterministic".format(case["id"]))


def validate(repo_root, verify_compiler_output=False):
    catalog_path = repo_root / "benchmarks" / "manifest-v1.json"
    catalog = json.loads(catalog_path.read_text(encoding="utf-8"))
    require(catalog.get("schema") == CATALOG_SCHEMA, "unsupported benchmark catalog schema")
    require(catalog.get("catalog_version") == 1, "catalog_version must be 1")
    require(catalog.get("suite_id") == "plc-robustness-core-v1", "unexpected suite_id")
    require(set(catalog.get("categories", [])) == CATEGORIES, "category registry is incomplete")
    require(set(catalog.get("complexity_levels", [])) == LEVELS, "complexity registry is incomplete")
    cases = catalog.get("cases")
    require(isinstance(cases, list) and len(cases) == 15, "catalog must contain exactly fifteen cases")
    expected_matrix = {(category, level) for category in CATEGORIES for level in LEVELS}
    observed_matrix = set()
    identifiers = set()
    source_paths = set()
    cataloged_testcases = testcase_catalog_paths(repo_root)
    for case in cases:
        require(isinstance(case, dict) and set(case) == CASE_FIELDS, "case fields do not match the schema")
        identifier = case["id"]
        require(isinstance(identifier, str) and identifier == "{}-{}".format(case["category"], case["complexity"]), "invalid benchmark id")
        require(identifier not in identifiers, "duplicate benchmark id: " + identifier)
        identifiers.add(identifier)
        observed_matrix.add((case["category"], case["complexity"]))
        require(case["profile"] == "legacy", identifier + " must use the legacy profile")
        require(isinstance(case["modeled_state_count"], int) and case["modeled_state_count"] > 0, identifier + " has invalid state count")
        require(isinstance(case["expected_behavior"], list) and len(case["expected_behavior"]) >= 2 and all(isinstance(value, str) and value for value in case["expected_behavior"]), identifier + " has incomplete expected behavior")
        require(case["origin"] == {"classification": "project-authored", "license": "GPL-3.0-only", "evidence": "repository-history"}, identifier + " is outside the version-one source boundary")

        source = checked_path(repo_root, case["source"], "testcases")
        require(case["source"] not in source_paths, "benchmark source is reused: " + case["source"])
        source_paths.add(case["source"])
        require(case["source"] in cataloged_testcases, "benchmark source is missing from testcase catalog: " + case["source"])
        require(sha256_file(source) == case["source_sha256"], identifier + " source checksum differs")
        declared_variables = case["inputs"] + case["outputs"]
        require(case["inputs"] and case["outputs"], identifier + " must declare inputs and outputs")
        require(all(isinstance(value, dict) and set(value) == VARIABLE_FIELDS for value in declared_variables), identifier + " has invalid variable metadata")
        require(len({value["name"] for value in declared_variables}) == len(declared_variables), identifier + " repeats a variable name")
        observed_variables = source_variables(source)
        require(observed_variables == declared_variables, identifier + " variable metadata differs from its source")

        replay = case["replay"]
        require(isinstance(replay, dict) and set(replay) == {"path", "sha256", "records"}, identifier + " has invalid replay metadata")
        replay_path = checked_path(repo_root, replay["path"], "benchmarks")
        require(sha256_file(replay_path) == replay["sha256"], identifier + " replay checksum differs")
        first_parse = parse_replay(replay_path)
        second_parse = parse_replay(replay_path)
        require(first_parse == second_parse and len(first_parse) == replay["records"], identifier + " replay is not deterministic")

        trace_meta = case["expected_trace"]
        require(isinstance(trace_meta, dict) and set(trace_meta) == {"path", "sha256"}, identifier + " has invalid trace metadata")
        trace_path = checked_path(repo_root, trace_meta["path"], "benchmarks")
        require(sha256_file(trace_path) == trace_meta["sha256"], identifier + " trace checksum differs")
        trace = json.loads(trace_path.read_text(encoding="utf-8"))
        require(trace.get("schema") == TRACE_SCHEMA and trace.get("benchmark_id") == identifier, identifier + " trace identity differs")
        steps = trace.get("steps")
        require(isinstance(steps, list) and len(steps) == replay["records"], identifier + " trace/replay step counts differ")
        input_names = {value["name"] for value in case["inputs"]}
        for index, step in enumerate(steps):
            require(step.get("index") == index, identifier + " trace indexes are not contiguous")
            require(set(step.get("inputs", {})).issubset(input_names), identifier + " trace names an undeclared input")
            require(all(isinstance(value, bool) for value in step.get("inputs", {}).values()), identifier + " trace input is not boolean")
            require(isinstance(step.get("expected_phase"), str) and step["expected_phase"], identifier + " trace phase is missing")
    require(observed_matrix == expected_matrix, "benchmark category/complexity matrix is incomplete")
    expected_sources = {
        path.relative_to(repo_root).as_posix() for path in (repo_root / "testcases" / "benchmarks").glob("*.st")
    }
    require(source_paths == expected_sources, "benchmark source directory and catalog differ")
    if verify_compiler_output:
        verify_compiler(repo_root, cases)
    print("PASS benchmark suite: {} cases{}".format(len(cases), " with deterministic compiler output" if verify_compiler_output else ""))


def main():
    parser = argparse.ArgumentParser(description="Validate the PLC Robustness Lab benchmark suite.")
    parser.add_argument("--verify-compiler", action="store_true")
    args = parser.parse_args()
    validate(pathlib.Path(__file__).resolve().parents[1], args.verify_compiler)


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print("Benchmark suite check failed: {}".format(error), file=os.sys.stderr)
        raise SystemExit(1)
