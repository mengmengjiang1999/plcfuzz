#!/usr/bin/env python3

import argparse
import csv
import os
from pathlib import Path
import subprocess
import sys
import tempfile


CATALOG_MARKER = "# plcfuzz-testcase-catalog-v1"
FIELDS = [
    "path",
    "original_path",
    "language",
    "collection",
    "profile",
    "expected",
    "origin",
    "license",
    "purpose",
]
ALLOWED = {
    "language": {"st", "ld"},
    "collection": {"active", "archived", "ld-reference", "matiec-experimental", "matiec-legacy"},
    "profile": {"legacy", "iec61131-3:2025-experimental", "not-applicable"},
    "expected": {"pass", "fail", "not-checked"},
    "origin": {"project-authored", "repository-history", "to-review"},
    "license": {"GPL-3.0-only", "to-review"},
    "purpose": {"runtime-example", "compiler-compatibility", "compatibility-reference", "ladder-reference"},
}


def report_error(errors, message):
    errors.append(message)


def tracked_testcases(repo_root):
    result = subprocess.run(
        ["git", "-C", str(repo_root), "ls-files", "-z", "--", "testcases"],
        check=True,
        stdout=subprocess.PIPE,
    )
    return {
        path
        for path in result.stdout.decode("utf-8").split("\0")
        if path.endswith((".st", ".ld"))
    }


def load_catalog(manifest_path):
    with manifest_path.open("r", encoding="utf-8", newline="") as manifest_file:
        marker = manifest_file.readline().rstrip("\r\n")
        if marker != CATALOG_MARKER:
            raise ValueError("catalog marker must be " + CATALOG_MARKER)
        reader = csv.DictReader(manifest_file, delimiter="\t")
        if reader.fieldnames != FIELDS:
            raise ValueError("catalog columns must be: " + ", ".join(FIELDS))
        return list(reader)


def validate_rows(rows, tracked_paths):
    errors = []
    seen = set()
    catalog_paths = []

    for number, row in enumerate(rows, start=3):
        path = row["path"]
        if not all(row[field] for field in FIELDS):
            report_error(errors, "line {} has an empty field".format(number))
        if path in seen:
            report_error(errors, "line {} duplicates {}".format(number, path))
        seen.add(path)
        catalog_paths.append(path)

        for field, values in ALLOWED.items():
            if row[field] not in values:
                report_error(errors, "line {} has unsupported {}: {}".format(number, field, row[field]))

        expected_extension = ".st" if row["language"] == "st" else ".ld"
        if not path.endswith(expected_extension) or not row["original_path"].endswith(expected_extension):
            report_error(errors, "line {} language does not match its paths".format(number))

        if row["language"] == "ld":
            if row["profile"] != "not-applicable" or row["expected"] != "not-checked":
                report_error(errors, "line {} LD metadata must use not-applicable/not-checked".format(number))
        elif row["profile"] == "not-applicable" or row["expected"] not in {"pass", "fail"}:
            report_error(errors, "line {} ST metadata must declare a profile and pass/fail result".format(number))

        is_archived = path.startswith("testcases/archive/incompatible-matiec/")
        if is_archived != (row["collection"] == "archived"):
            report_error(errors, "line {} archive collection does not match its path".format(number))
        if is_archived and row["expected"] != "fail":
            report_error(errors, "line {} archived ST case must declare fail".format(number))

    if catalog_paths != sorted(catalog_paths):
        report_error(errors, "catalog paths must be sorted")

    missing = sorted(tracked_paths - seen)
    extra = sorted(seen - tracked_paths)
    for path in missing:
        report_error(errors, "manifest is missing tracked testcase: " + path)
    for path in extra:
        report_error(errors, "manifest contains an untracked testcase: " + path)
    return errors


def verify_compiler(rows, repo_root, errors):
    compiler = Path(os.environ.get("MATIEC_IEC2C", repo_root / "third_party/matiec/iec2c"))
    include_dir = Path(os.environ.get("MATIEC_INCLUDE_DIR", repo_root / "third_party/matiec/lib"))
    if not compiler.is_file() or not os.access(str(compiler), os.X_OK):
        report_error(errors, "MatIEC compiler is missing: " + str(compiler))
        return

    checked = 0
    with tempfile.TemporaryDirectory(prefix="plcfuzz-catalog-") as temporary_root:
        for row in rows:
            if row["language"] != "st":
                continue
            output_dir = Path(temporary_root) / str(checked)
            output_dir.mkdir()
            command = [
                str(compiler),
                "--std=" + row["profile"],
                "-f",
                "-l",
                "-p",
                "-I",
                str(include_dir),
                "-T",
                str(output_dir),
                str(repo_root / row["path"]),
            ]
            result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            observed = "pass" if result.returncode == 0 else "fail"
            if observed != row["expected"]:
                report_error(
                    errors,
                    "{} expected {} but compiler observed {}".format(row["path"], row["expected"], observed),
                )
            checked += 1
    print("Checked {} ST compiler expectations".format(checked))


def main():
    parser = argparse.ArgumentParser(description="Validate the PLCFuzz testcase catalog")
    parser.add_argument("--verify-compiler", action="store_true", help="check all ST expectations with MatIEC")
    arguments = parser.parse_args()

    repo_root = Path(__file__).resolve().parent.parent
    manifest_path = repo_root / "testcases/manifest.tsv"
    try:
        rows = load_catalog(manifest_path)
        tracked_paths = tracked_testcases(repo_root)
    except (OSError, ValueError, subprocess.CalledProcessError, UnicodeError) as error:
        print("Catalog validation failed: {}".format(error), file=sys.stderr)
        return 1

    errors = validate_rows(rows, tracked_paths)
    if arguments.verify_compiler:
        verify_compiler(rows, repo_root, errors)
    if errors:
        for error in errors:
            print("Catalog validation failed: " + error, file=sys.stderr)
        return 1

    st_count = sum(row["language"] == "st" for row in rows)
    ld_count = sum(row["language"] == "ld" for row in rows)
    print("PASS testcase catalog: {} ST, {} LD".format(st_count, ld_count))
    return 0


if __name__ == "__main__":
    sys.exit(main())
