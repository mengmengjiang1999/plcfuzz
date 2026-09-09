#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
scope="$repo_root/coverage/scope-v1.json"
baseline="$repo_root/coverage/baseline-v1.json"
collector="$repo_root/scripts/run_project_coverage.sh"

test -f "$scope"
test -f "$baseline"
test -x "$collector"
python3 - "$repo_root" "$scope" "$baseline" <<'PY'
import importlib.util
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
spec = importlib.util.spec_from_file_location("coverage_report", root / "scripts/coverage_report.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
scope = json.loads(pathlib.Path(sys.argv[2]).read_text(encoding="utf-8"))
baseline = json.loads(pathlib.Path(sys.argv[3]).read_text(encoding="utf-8"))
digest = module.validate_scope(scope, root)
module.validate_baseline(baseline, digest)
assert "src/main.cpp" in scope["cpp_sources"]
assert "src/offline_runtime.cpp" in scope["cpp_sources"]
assert "src/runtime_input_application.cpp" in scope["cpp_sources"]
assert "src/runtime_cycle_scheduler.cpp" in scope["cpp_sources"]
assert "src/runtime_state_observer.cpp" in scope["cpp_sources"]
assert "src/runtime_result_recorder.cpp" in scope["cpp_sources"]
assert "src/modbus_discrete.cpp" in scope["cpp_sources"]
assert "src/modbus_registers.cpp" in scope["cpp_sources"]
assert "include/plc_input_apply.h" in scope["cpp_sources"]
assert "static_analyse/main.py" in scope["python_sources"]
assert baseline["enforcement"] == "report-only"
PY
rg --quiet 'build/coverage-work\.XXXXXX' "$collector"
rg --quiet 'testcases/no_concurrency_candidate/state_test\.st' "$collector"
rg --quiet 'PLC_LAB_CYCLE_COUNT=1' "$collector"
rg --quiet 'lcov --extract' "$collector"
rg --quiet 'python3 -m coverage json' "$collector"
rg --quiet 'src/glueVars\.cpp' "$scope"
rg --quiet 'third_party/' "$scope"
rg --quiet 'plclogic/' "$scope"

echo "PASS project coverage workflow structure"
