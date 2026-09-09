#!/usr/bin/env python3
"""Small executable fixture with a stable version response."""

import sys
import pathlib


if "--version" in sys.argv:
    print("afl-fuzz ++5.03c fixture")
else:
    output_index = sys.argv.index("-o") + 1
    output_dir = pathlib.Path(sys.argv[output_index])
    output_dir.mkdir(parents=True)
    (output_dir / "fixture-complete").write_text("ok\n", encoding="utf-8")
