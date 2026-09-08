#!/usr/bin/env python3

import os
import pathlib
import resource
import signal
import sys


resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
data = pathlib.Path(sys.argv[1]).read_bytes()
if b"X" in data:
    print("synthetic diagnostic marker", file=sys.stderr)
    os.kill(os.getpid(), signal.SIGABRT)
if b"E" in data:
    raise SystemExit(2)
