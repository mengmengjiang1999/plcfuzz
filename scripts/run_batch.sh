#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
selection=${1:-all}
batch_root=${BATCH_OUTPUT_DIR:-"$repo_root/findings/batch"}

if [[ $selection == -h || $selection == --help ]]; then
    echo "Usage: ./scripts/plcfuzz batch [all|case-name]"
    exit 0
fi

if [[ $selection == all ]]; then
    testcases=("$repo_root"/testcases/auto_race/auto*.st)
else
    name=${selection%.st}
    testcases=("$repo_root/testcases/auto_race/$name.st")
fi

for testcase in "${testcases[@]}"; do
    if [[ ! -f $testcase ]]; then
        echo "Batch testcase is missing: $testcase" >&2
        exit 1
    fi
    name=$(basename "$testcase" .st)
    echo "Running isolated case: $name"
    "$repo_root/scripts/plcfuzz" build all "$testcase"
    FINDINGS_DIR="$batch_root/$name" "$repo_root/scripts/plcfuzz" experiment
done
