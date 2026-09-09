#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
report_path=${1:-/opt/plcfuzz-acceptance/report.json}
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
MATIEC_RUN_TESTS=1 ./scripts/plcfuzz setup
./scripts/plcfuzz test unit
python3 scripts/check_testcase_manifest.py --verify-compiler
./scripts/plcfuzz test testcases
./scripts/plcfuzz build plc testcases/race_test_success.st
./scripts/plcfuzz build runtime
./scripts/plcfuzz build analyze
./scripts/plcfuzz build mutator
./scripts/plcfuzz diagnostics all
PLCFUZZ_INSTRUMENTED_CXX=${PLCFUZZ_INSTRUMENTED_CXX:-afl-clang-fast++} ./scripts/plcfuzz build instrumented
run_expected_candidate /tmp/plcfuzz-normal-playback.log ./scripts/plcfuzz run "$seed_file"
run_expected_candidate /tmp/plcfuzz-instrumented-playback.log ./scripts/plcfuzz replay "$seed_file"

test -x openplc
test -x openplc_fuzz
test -s plc_variables_mapping.csv
test -f build/mutator/libplc_mutator.so
test -x build/diagnostics/runtime/openplc_diagnostic
find build/diagnostics/mutator -maxdepth 1 -type f -name 'libplc_mutator.*' -print -quit | grep -q .

python3 scripts/write_linux_acceptance_report.py internal "$report_path"
echo "Linux container acceptance passed: $report_path"
