#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

for testcase in "$repo_root"/testcases/auto_race/auto*.st; do
    name=$(basename "$testcase" .st)
    echo "Running $name"
    "$repo_root/buildscript_new.sh" "$name"
done
