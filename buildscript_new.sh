#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <auto-test-name>" >&2
    echo "Example: $0 auto1" >&2
    exit 2
fi

name=$1
testcase="$repo_root/testcases/auto_race/$name.st"
result_dir=${RESULT_DIR:-"$repo_root/results"}

"$repo_root/buildscript.sh" all "$testcase"
"$repo_root/runfuzz.sh"

mkdir -p "$result_dir"
cp "$repo_root/findings/default/fuzzer_stats" "$result_dir/fuzzer_stats_$name"
cp "$repo_root/findings/default/plot_data" "$result_dir/plot_data_$name"
