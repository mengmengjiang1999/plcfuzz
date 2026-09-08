#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
iec2c=${MATIEC_IEC2C:-"$repo_root/third_party/matiec/iec2c"}
include_dir=${MATIEC_INCLUDE_DIR:-"$repo_root/third_party/matiec/lib"}
test_root="$repo_root/testcases/matiec"
output_root=$(mktemp -d "${TMPDIR:-/tmp}/plcfuzz-matiec-tests.XXXXXX")
trap 'rm -rf "$output_root"' EXIT

if [[ ! -x $iec2c ]]; then
    echo "MatIEC compiler is missing: $iec2c" >&2
    echo "Run ./scripts/setup_matiec.sh first." >&2
    exit 1
fi

run_profile() {
    local profile=$1
    local directory=$2
    local count=0

    for testcase in "$directory"/*.st; do
        local name
        local output_dir
        name=$(basename "$testcase" .st)
        output_dir="$output_root/$profile/$name"
        mkdir -p "$output_dir"
        "$iec2c" \
            "--std=$profile" \
            -f -l -p \
            -I "$include_dir" \
            -T "$output_dir" \
            "$testcase"
        count=$((count + 1))
        echo "PASS [$profile] $name"
    done

    if [[ $count -eq 0 ]]; then
        echo "No test cases found in $directory" >&2
        exit 1
    fi
}

run_profile legacy "$test_root/legacy"
run_profile iec61131-3:2025-experimental "$test_root/experimental"
