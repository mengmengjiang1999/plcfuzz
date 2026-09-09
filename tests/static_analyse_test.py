#!/usr/bin/env python3

import importlib.util
from pathlib import Path
import tempfile

REPO_ROOT = Path(__file__).resolve().parent.parent
SPEC = importlib.util.spec_from_file_location("plc_lab_static_analyse", REPO_ROOT / "static_analyse/main.py")
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)

def write_fixture(directory, content):
    path = Path(directory) / "LOCATED_VARIABLES.h"
    path.write_text(content, encoding="utf-8")
    return path

def expect_invalid(directory, content, message):
    try:
        MODULE.parse_located_variables(write_fixture(directory, content))
    except MODULE.MappingError as error:
        assert message in str(error)
    else:
        raise AssertionError("invalid fixture was accepted")

def main():
    fixture = "\n".join([
        "__LOCATED_VAR(BOOL,__IX0_1,I,X,0,1)", "__LOCATED_VAR(BOOL,__QX1_2,Q,X,1,2)",
        "__LOCATED_VAR(BYTE,__IB2,I,B,2)", "__LOCATED_VAR(BYTE,__QB3,Q,B,3)",
        "__LOCATED_VAR(UINT,__IW4,I,W,4)", "__LOCATED_VAR(UINT,__QW5,Q,W,5)",
        "__LOCATED_VAR(UDINT,__ID6,I,D,6)", "__LOCATED_VAR(UDINT,__QD7,Q,D,7)",
        "__LOCATED_VAR(ULINT,__IL8,I,L,8)", "__LOCATED_VAR(ULINT,__QL9,Q,L,9)",
        "__LOCATED_VAR(UINT,__MW10,M,W,10)", "__LOCATED_VAR(UDINT,__MD11,M,D,11)",
        "__LOCATED_VAR(ULINT,__ML12,M,L,12)",
    ]) + "\n"
    with tempfile.TemporaryDirectory(prefix="plc-lab-mapping-test-") as directory:
        mappings = MODULE.parse_located_variables(write_fixture(directory, fixture))
        assert [row[0] for row in mappings] == list(MODULE.IO_MAPPINGS.values())
        output = Path(directory) / "mapping.csv"
        MODULE.save_to_csv(mappings, output)
        assert output.read_bytes().startswith("变量类型,数组索引".encode("utf-8"))
        expect_invalid(directory, "not a record\n", "expected one __LOCATED_VAR")
        expect_invalid(directory, "__LOCATED_VAR(BOOL,__IX0_0,I,X,0)\n", "requires a bit index")
        expect_invalid(directory, "__LOCATED_VAR(BOOL,__IX0_8,I,X,0,8)\n", "between 0 and 7")
        expect_invalid(directory, "__LOCATED_VAR(UINT,__IW1,I,W,-1)\n", "non-negative decimal")
        expect_invalid(directory, "__LOCATED_VAR(UINT,__IW2,I,W,1)\n", "does not match")
        expect_invalid(directory, "__LOCATED_VAR(BOOL,__MX0_0,M,X,0,0)\n", "unsupported location class")
        expect_invalid(directory, "__LOCATED_VAR(BOOL,__IW0,I,W,0)\n", "incompatible with width")
        expect_invalid(directory, "__LOCATED_VAR(BOOL,__IX0_0,I,X,0,0)\n" * 2, "duplicate runtime destination")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
