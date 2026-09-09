#!/usr/bin/env python3
import argparse
import datetime
import json
import os
import platform
import subprocess
from pathlib import Path


COMMANDS = [
    "./scripts/verify_preserved_artifacts.sh",
    "./scripts/check_source_layout.sh",
    "./scripts/check_project_wording.sh",
    "MATIEC_RUN_TESTS=1 ./scripts/plc-lab setup",
    "./scripts/plc-lab test unit",
    "python3 scripts/check_testcase_manifest.py --verify-compiler",
    "./scripts/plc-lab test testcases",
    "./scripts/plc-lab build plc testcases/concurrency_reference.st",
    "./scripts/plc-lab build runtime",
    "./scripts/plc-lab build analyze",
    "./scripts/plc-lab build transformer",
    "./scripts/plc-lab diagnostics all",
    "PLC_LAB_INSTRUMENTED_CXX=afl-clang-fast++ ./scripts/plc-lab build instrumented",
    "./scripts/plc-lab run 'seeds copy/seed_0' (expected output-change candidate signal)",
    "./scripts/plc-lab replay 'seeds copy/seed_0' (expected output-change candidate signal)",
]

PACKAGES = [
    "autoconf",
    "automake",
    "bison",
    "build-essential",
    "clang",
    "cmake",
    "flex",
    "git",
    "libtool",
    "lld",
    "llvm-dev",
    "pkg-config",
    "python3",
    "ripgrep",
]


def output(command):
    return subprocess.check_output(command, text=True, stderr=subprocess.STDOUT).strip().splitlines()[0]


def write_json(path, value):
    destination = Path(path)
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary = destination.with_suffix(destination.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(destination)


def internal_report(path):
    package_versions = {
        package: output(["dpkg-query", "-W", "-f=${Version}", package]) for package in PACKAGES
    }
    report = {
        "schema": "plc-lab-linux-container-acceptance-v1",
        "status": "passed",
        "base_image": os.environ["PLC_LAB_BASE_IMAGE"],
        "source_revision": os.environ["PLC_LAB_SOURCE_REVISION"],
        "matiec_revision": os.environ["PLC_LAB_MATIEC_REVISION"],
        "platform": {"machine": platform.machine(), "system": platform.system(), "release": platform.release()},
        "commands": COMMANDS,
        "tools": {
            "automated_input_tool": output(["afl-fuzz", "--version"]),
            "cmake": output(["cmake", "--version"]),
            "compiler": output(["c++", "--version"]),
            "matiec_iec2c": output(["./third_party/matiec/iec2c", "-v"]),
            "python": output(["python3", "--version"]),
        },
        "packages": package_versions,
    }
    write_json(path, report)


def combined_report(arguments):
    internal = json.loads(Path(arguments.internal_report).read_text(encoding="utf-8"))
    combined = {
        "schema": "plc-lab-linux-container-host-acceptance-v1",
        "status": "passed",
        "completed_at_utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "requested_platform": arguments.platform,
        "image_tag": arguments.image_tag,
        "base_image_id": arguments.base_image_id,
        "final_image_content_digest": arguments.final_image_digest,
        "internal": internal,
    }
    write_json(arguments.output, combined)


def parse_args():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="mode", required=True)
    internal = subparsers.add_parser("internal")
    internal.add_argument("output")
    combine = subparsers.add_parser("combine")
    combine.add_argument("--internal-report", required=True)
    combine.add_argument("--output", required=True)
    combine.add_argument("--platform", required=True)
    combine.add_argument("--image-tag", required=True)
    combine.add_argument("--base-image-id", required=True)
    combine.add_argument("--final-image-digest", required=True)
    return parser.parse_args()


def main():
    arguments = parse_args()
    if arguments.mode == "internal":
        internal_report(arguments.output)
    else:
        combined_report(arguments)


if __name__ == "__main__":
    main()
