#!/usr/bin/env python3

from pathlib import Path
import sys


REPO_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO_ROOT / "scripts"))

from check_testcase_manifest import validate_rows  # noqa: E402


def st_row(path="testcases/example.st"):
    return {
        "path": path,
        "original_path": path,
        "language": "st",
        "collection": "active",
        "profile": "legacy",
        "expected": "pass",
        "origin": "to-review",
        "license": "to-review",
        "purpose": "runtime-example",
    }


def main():
    row = st_row()
    assert validate_rows([row], {row["path"]}) == []

    duplicate_errors = validate_rows([row, dict(row)], {row["path"]})
    assert any("duplicates" in error for error in duplicate_errors)

    missing_errors = validate_rows([row], {row["path"], "testcases/missing.ld"})
    assert any("missing tracked testcase" in error for error in missing_errors)

    invalid_ld = st_row("testcases/example.ld")
    invalid_ld["language"] = "ld"
    invalid_ld["collection"] = "ld-reference"
    invalid_ld["purpose"] = "ladder-reference"
    ld_errors = validate_rows([invalid_ld], {invalid_ld["path"]})
    assert any("not-applicable/not-checked" in error for error in ld_errors)
    return 0


if __name__ == "__main__":
    sys.exit(main())
