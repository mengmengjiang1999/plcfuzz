#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
workflow="$repo_root/.github/workflows/linux-quality.yml"
setup_script="$repo_root/scripts/setup_matiec.sh"

test -f "$workflow"
test -f "$setup_script"
rg --quiet '^name: Linux quality checks$' "$workflow"
rg --quiet '^  contents: read$' "$workflow"
rg --quiet '^    runs-on: ubuntu-22\.04$' "$workflow"
rg --quiet '^      MATIEC_BUILD_JOBS: "1"$' "$workflow"
rg --quiet 'submodules: recursive' "$workflow"
rg --quiet 'MATIEC_RUN_TESTS=1 ./scripts/setup_matiec\.sh' "$workflow"
rg --quiet 'pkg-config python3 ripgrep' "$workflow"
rg --quiet 'check_testcase_manifest\.py --verify-compiler' "$workflow"
rg --quiet 'git clone --branch v4\.10c --depth 1' "$workflow"
rg --quiet './buildscript\.sh runtime' "$workflow"
rg --quiet './buildscript\.sh mutator' "$workflow"
rg --quiet './buildscript\.sh fuzz' "$workflow"
rg --quiet '^mkdir -p stage4/\.deps$' "$setup_script"
if rg --quiet 'contents: write' "$workflow"; then
    echo "CI workflow must not request repository write permission." >&2
    exit 1
fi

echo "PASS Linux CI workflow structure"
