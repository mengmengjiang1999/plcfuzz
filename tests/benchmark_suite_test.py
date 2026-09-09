#!/usr/bin/env python3
"""Exercise benchmark catalog and replay validation."""

import importlib.util
import pathlib
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
HELPER = REPO_ROOT / "scripts" / "check_benchmark_suite.py"
SPEC = importlib.util.spec_from_file_location("check_benchmark_suite", HELPER)
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


def expect_invalid(path, fragment):
    try:
        MODULE.parse_replay(path)
    except ValueError as error:
        assert fragment in str(error), str(error)
    else:
        raise AssertionError("expected invalid replay")


def main():
    MODULE.validate(REPO_ROOT)
    timer = MODULE.parse_replay(REPO_ROOT / "benchmarks" / "replay" / "timer-simple.txt")
    assert len(timer) == 6
    assert len(timer[0]) == 119
    with tempfile.TemporaryDirectory(prefix="plc-lab-benchmark-test-") as temporary:
        root = pathlib.Path(temporary)
        missing_header = root / "missing-header.txt"
        missing_header.write_text("0 " * 119, encoding="utf-8")
        expect_invalid(missing_header, "V1 header")
        short = root / "short.txt"
        short.write_text("PLCFUZZ_INPUT_V1\n0 1\n", encoding="utf-8")
        expect_invalid(short, "119 fields")
        nonnumeric = root / "nonnumeric.txt"
        nonnumeric.write_text("PLCFUZZ_INPUT_V1\n" + " ".join(["x"] + ["0"] * 118), encoding="utf-8")
        expect_invalid(nonnumeric, "unsigned decimal")
        out_of_range = root / "range.txt"
        out_of_range.write_text(
            "PLCFUZZ_INPUT_V1\n" + " ".join(["0", "256"] + ["0"] * 117),
            encoding="utf-8",
        )
        expect_invalid(out_of_range, "type bound")


if __name__ == "__main__":
    main()
