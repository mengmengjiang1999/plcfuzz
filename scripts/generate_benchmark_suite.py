#!/usr/bin/env python3
"""Generate deterministic catalog and replay artifacts for the benchmark suite."""

import hashlib
import json
import os
import pathlib
import re
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
BENCHMARK_ROOT = REPO_ROOT / "benchmarks"
SOURCE_ROOT = REPO_ROOT / "testcases" / "benchmarks"
SCHEMA = "PLC_LAB_BENCHMARK_CATALOG_V1"
TRACE_SCHEMA = "PLC_LAB_BENCHMARK_TRACE_V1"
CATEGORIES = ("timer", "counter", "state-machine", "interlock", "sequential-control")
LEVELS = ("simple", "general", "complex")
STATE_COUNTS = {
    "timer": (2, 4, 4),
    "counter": (4, 15, 12),
    "state-machine": (2, 4, 6),
    "interlock": (2, 4, 5),
    "sequential-control": (2, 4, 6),
}
BEHAVIORS = {
    "timer": "Timed stages progress only while their declared enabling condition is active.",
    "counter": "Rising input events advance bounded count states and reset restores the initial count.",
    "state-machine": "Boolean commands move the controller through explicitly enumerated logical modes.",
    "interlock": "Mutually constrained requests never enable incompatible outputs at the same time.",
    "sequential-control": "Completion inputs advance an ordered sequence and reset returns to its first step.",
}
LEVEL_NOTES = {
    "simple": "One primary transition demonstrates the control pattern.",
    "general": "Multiple inputs and outputs exercise branching or parallel status.",
    "complex": "Several persistent states exercise an extended transition sequence.",
}
REPLAY_MASKS = {
    "simple": [0, 1, 1, 0, 2, 0],
    "general": [0, 1, 2, 4, 3, 8, 0],
    "complex": [0, 1, 2, 4, 8, 16, 32, 64, 0],
}
LOCATED_PATTERN = re.compile(
    r"^\s*([A-Za-z][A-Za-z0-9_]*)\s+AT\s+(%[IQ][XWDL][0-9.]+)\s*:\s*([A-Za-z][A-Za-z0-9_]*)\s*;",
    re.MULTILINE,
)


def atomic_write(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    handle, temporary_name = tempfile.mkstemp(prefix=path.name + ".", dir=str(path.parent))
    try:
        with os.fdopen(handle, "wb") as stream:
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary_name, str(path))
    except Exception:
        try:
            os.unlink(temporary_name)
        except OSError:
            pass
        raise


def json_bytes(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode("utf-8")


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def record(mask):
    values = [1, mask] + [0] * 63
    for _ in range(6):
        values.extend([1] + [0] * 8)
    assert len(values) == 119
    return " ".join(str(value) for value in values)


def case_id(category, level):
    return "{}-{}".format(category, level)


def source_name(category, level):
    return "{}_{}.st".format(category.replace("-", "_"), level)


def located_variables(source_text):
    variables = []
    for name, address, value_type in LOCATED_PATTERN.findall(source_text):
        variables.append({"name": name, "address": address, "type": value_type})
    return variables


def generate():
    cases = []
    for category in CATEGORIES:
        for level_index, level in enumerate(LEVELS):
            identifier = case_id(category, level)
            source_path = pathlib.Path("testcases/benchmarks") / source_name(category, level)
            source_data = (REPO_ROOT / source_path).read_bytes()
            variables = located_variables(source_data.decode("utf-8"))
            inputs = [item for item in variables if item["address"].startswith("%I")]
            outputs = [item for item in variables if item["address"].startswith("%Q")]
            masks = REPLAY_MASKS[level]
            replay_data = (
                "PLCFUZZ_INPUT_V1\n" + "\n".join(record(mask) for mask in masks) + "\n"
            ).encode("utf-8")
            replay_path = pathlib.Path("benchmarks/replay") / (identifier + ".txt")
            input_names = [item["name"] for item in inputs if item["type"] == "BOOL"]
            trace = {
                "schema": TRACE_SCHEMA,
                "benchmark_id": identifier,
                "steps": [
                    {
                        "index": index,
                        "inputs": {
                            name: bool(mask & (1 << bit))
                            for bit, name in enumerate(input_names)
                        },
                        "expected_phase": "{}-step-{}".format(level, index),
                    }
                    for index, mask in enumerate(masks)
                ],
            }
            trace_data = json_bytes(trace)
            trace_path = pathlib.Path("benchmarks/traces") / (identifier + ".json")
            atomic_write(REPO_ROOT / replay_path, replay_data)
            atomic_write(REPO_ROOT / trace_path, trace_data)
            cases.append(
                {
                    "id": identifier,
                    "category": category,
                    "complexity": level,
                    "profile": "legacy",
                    "source": str(source_path),
                    "source_sha256": sha256(source_data),
                    "inputs": inputs,
                    "outputs": outputs,
                    "modeled_state_count": STATE_COUNTS[category][level_index],
                    "expected_behavior": [BEHAVIORS[category], LEVEL_NOTES[level]],
                    "origin": {
                        "classification": "project-authored",
                        "license": "GPL-3.0-only",
                        "evidence": "repository-history",
                    },
                    "replay": {
                        "path": str(replay_path),
                        "sha256": sha256(replay_data),
                        "records": len(masks),
                    },
                    "expected_trace": {
                        "path": str(trace_path),
                        "sha256": sha256(trace_data),
                    },
                }
            )
    catalog = {
        "schema": SCHEMA,
        "catalog_version": 1,
        "suite_id": "plc-robustness-core-v1",
        "scope": "Project-authored offline PLC software-quality comparison programs.",
        "categories": list(CATEGORIES),
        "complexity_levels": list(LEVELS),
        "cases": cases,
    }
    atomic_write(BENCHMARK_ROOT / "manifest-v1.json", json_bytes(catalog))
    print("Generated {} benchmark cases".format(len(cases)))


if __name__ == "__main__":
    generate()
