#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
report_path=${1:-/opt/plc-lab-acceptance/report.json}
seed_file="$repo_root/seeds copy/seed_0"

run_expected_candidate() {
    local log_path=$1
    shift

    set +e
    "$@" >"$log_path" 2>&1
    local status=$?
    set -e

    if [[ $status -ne 134 ]]; then
        echo "Expected candidate signal exit status 134, observed $status: $*" >&2
        cat "$log_path" >&2
        return 1
    fi
    if ! rg --quiet 'Output-change candidate detected' "$log_path"; then
        echo "Expected output-change candidate message is missing: $*" >&2
        cat "$log_path" >&2
        return 1
    fi
}

cd "$repo_root"

./scripts/verify_preserved_artifacts.sh
./scripts/check_source_layout.sh
./scripts/check_project_wording.sh
MATIEC_RUN_TESTS=1 ./scripts/plc-lab setup
./scripts/plc-lab test unit
python3 scripts/check_testcase_manifest.py --verify-compiler
./scripts/plc-lab test testcases
./scripts/plc-lab build plc testcases/concurrency_reference.st
./scripts/plc-lab build runtime
./scripts/plc-lab build analyze
./scripts/plc-lab build transformer
./scripts/plc-lab diagnostics all
PLC_LAB_INSTRUMENTED_CXX=${PLC_LAB_INSTRUMENTED_CXX:-afl-clang-fast++} ./scripts/plc-lab build instrumented
run_expected_candidate /tmp/plc-lab-normal-playback.log ./scripts/plc-lab run "$seed_file"
run_expected_candidate /tmp/plc-lab-instrumented-playback.log ./scripts/plc-lab replay "$seed_file"

test -x openplc
test -x openplc_instrumented
test -s plc_variables_mapping.csv
test -f build/input-transformer/libplc_input_transformer.so
test -x build/diagnostics/runtime/openplc_diagnostic
find build/diagnostics/input-transformer -maxdepth 1 -type f -name 'libplc_input_transformer.*' -print -quit | grep -q .

python3 scripts/write_linux_acceptance_report.py internal "$report_path"
echo "Linux container acceptance passed: $report_path"
