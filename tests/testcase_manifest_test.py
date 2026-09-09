#!/usr/bin/env python3

from pathlib import Path
import sys


REPO_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO_ROOT / "scripts"))

from check_testcase_manifest import validate_provenance, validate_rows  # noqa: E402


def st_row(path="testcases/example.st"):
    return {
        "path": path,
        "original_path": path,
        "language": "st",
        "collection": "active",
        "profile": "legacy",
        "expected": "pass",
        "origin": "project-authored",
        "license": "GPL-3.0-only",
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
    invalid_ld["origin"] = "ldmicro"
    invalid_ld["license"] = "GPL-3.0-or-later"
    ld_errors = validate_rows([invalid_ld], {invalid_ld["path"]})
    assert any("not-applicable/not-checked" in error for error in ld_errors)

    missing_evidence = validate_provenance([row], [], [], REPO_ROOT)
    assert any("origins must exactly match" in error for error in missing_evidence)

    project_evidence = {
        "origin": "project-authored",
        "scope": "test scope",
        "source_url": "https://github.com/example/project",
        "source_revision": "1" * 40,
        "license": "GPL-3.0-or-later",
        "redistribution": "permitted-with-license-and-notices",
        "evidence": "https://github.com/example/project/commits/main",
        "notes": "test evidence",
    }
    inconsistent = validate_provenance([row], [project_evidence], [], REPO_ROOT)
    assert any("license differs" in error for error in inconsistent)

    ld_row = st_row("testcases/example.ld")
    ld_row.update(
        {
            "language": "ld",
            "collection": "ld-reference",
            "profile": "not-applicable",
            "expected": "not-checked",
            "origin": "ldmicro",
            "license": "GPL-3.0-or-later",
            "purpose": "ladder-reference",
        }
    )
    ldmicro_evidence = dict(project_evidence)
    ldmicro_evidence.update(
        {
            "origin": "ldmicro",
            "source_revision": "5b058e05103d85a93c9b91807307b1bd44ee0925",
            "license": "GPL-3.0-or-later",
        }
    )
    mapping_gap = validate_provenance([ld_row], [ldmicro_evidence], [], REPO_ROOT)
    assert any("exactly cover" in error for error in mapping_gap)
    return 0


if __name__ == "__main__":
    sys.exit(main())
