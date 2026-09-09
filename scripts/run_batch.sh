#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
selection=${1:-all}
batch_root=${BATCH_OBSERVATIONS_DIR:-${BATCH_OUTPUT_DIR:-"$repo_root/observations/batch"}}

if [[ $selection == -h || $selection == --help ]]; then
    echo "Usage: ./scripts/plc-lab batch [all|case-name]"
    exit 0
fi

if [[ $selection == all ]]; then
    testcases=("$repo_root"/testcases/generated_concurrency/auto*.st)
else
    name=${selection%.st}
    testcases=("$repo_root/testcases/generated_concurrency/$name.st")
fi

for testcase in "${testcases[@]}"; do
    if [[ ! -f $testcase ]]; then
        echo "Batch testcase is missing: $testcase" >&2
        exit 1
    fi
    name=$(basename "$testcase" .st)
    echo "Running isolated case: $name"
    "$repo_root/scripts/plc-lab" build all "$testcase"
    OBSERVATIONS_DIR="$batch_root/$name" "$repo_root/scripts/plc-lab" experiment
done
