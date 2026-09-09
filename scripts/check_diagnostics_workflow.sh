#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
build_script="$repo_root/scripts/build_diagnostics.sh"
organizer="$repo_root/scripts/organize_abnormal_samples.py"
workflow="$repo_root/.github/workflows/linux-quality.yml"

test -f "$build_script"
test -f "$organizer"
rg --quiet --fixed-strings -- '-fsanitize=address,undefined' "$build_script"
rg --quiet 'build/diagnostics/runtime/openplc_diagnostic' "$build_script"
rg --quiet 'build/diagnostics/input-transformer' "$build_script"
rg --quiet '^      - name: Build diagnostic targets$' "$workflow"
rg --quiet './scripts/plc-lab diagnostics all' "$workflow"
python3 "$organizer" --help >/dev/null

echo "PASS runtime diagnostic workflow structure"
