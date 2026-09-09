#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
input_file=${1:-"$repo_root/terminaloutput/input.txt"}

if [[ ! -x $repo_root/openplc ]]; then
    echo "Runtime target is missing; run ./scripts/plcfuzz build runtime first." >&2
    exit 1
fi

if [[ ! -f $input_file ]]; then
    echo "Input file not found: $input_file" >&2
    exit 1
fi

exec "$repo_root/openplc" "$input_file"
