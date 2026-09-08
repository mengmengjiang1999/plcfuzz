#!/usr/bin/env python3

import json
import pathlib
import subprocess
import tempfile


REPO_ROOT = pathlib.Path(__file__).resolve().parent.parent
ORGANIZER = REPO_ROOT / "scripts" / "organize_abnormal_samples.py"
TARGET = REPO_ROOT / "tests" / "fixtures" / "abnormal_signal_target.py"


def run_organizer(input_dir, output_dir):
    return subprocess.run(
        [
            "python3",
            str(ORGANIZER),
            "--input-dir",
            str(input_dir),
            "--output-dir",
            str(output_dir),
            "--target",
            str(TARGET),
            "--repeats",
            "2",
            "--timeout",
            "2",
            "--max-minimize-evaluations",
            "100",
            "--seed",
            "fixture-seed",
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=False,
    )


with tempfile.TemporaryDirectory(prefix="plcfuzz-organizer-test-") as directory:
    root = pathlib.Path(directory)
    input_dir = root / "inputs"
    output_dir = root / "organized"
    input_dir.mkdir()
    (input_dir / "candidate-a.bin").write_bytes(b"prefix-X-suffix")
    (input_dir / "candidate-a-copy.bin").write_bytes(b"prefix-X-suffix")
    (input_dir / "ordinary-error.bin").write_bytes(b"E")
    (input_dir / "ordinary-success.bin").write_bytes(b"ordinary")

    result = run_organizer(input_dir, output_dir)
    assert result.returncode == 0, result.stderr
    manifest = json.loads((output_dir / "manifest.json").read_text(encoding="utf-8"))
    assert manifest["schema"] == "PLCFUZZ_ABNORMAL_SAMPLE_MANIFEST_V1"
    assert manifest["scanned_files"] == 4
    assert manifest["unique_inputs"] == 3
    assert manifest["seed"] == "fixture-seed"
    assert len(manifest["retained_cases"]) == 1

    case = manifest["retained_cases"][0]
    assert case["signal_name"] == "SIGABRT"
    assert case["minimized_size"] == 1
    assert (output_dir / case["sample"]).read_bytes() == b"X"
    diagnostic = (output_dir / case["diagnostic"]).read_text(encoding="utf-8")
    assert "synthetic diagnostic marker" in diagnostic

    refused = run_organizer(input_dir, output_dir)
    assert refused.returncode == 2
    assert "output directory is not empty" in refused.stderr
