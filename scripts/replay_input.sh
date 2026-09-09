#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
input_file=${1:-}

if [[ -z $input_file ]]; then
    input_file=$(find "$repo_root/findings" -path '*/afl-output/*/queue/*' -type f -print -quit 2>/dev/null || true)
fi

if [[ -z $input_file || ! -f $input_file ]]; then
    echo "Usage: ./scripts/plcfuzz replay <saved-input-file>" >&2
    exit 2
fi
if [[ ! -x $repo_root/openplc_fuzz ]]; then
    echo "Instrumented target is missing; run ./scripts/plcfuzz build instrumented first." >&2
    exit 1
fi

exec "$repo_root/openplc_fuzz" "$input_file"
