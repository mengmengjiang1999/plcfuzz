#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
workflow="$repo_root/.github/workflows/linux-quality.yml"
setup_script="$repo_root/scripts/setup_matiec.sh"
instrumented_build_script="$repo_root/build_scripts/buildfuzz.sh"
dockerfile="$repo_root/Dockerfile.repro"

test -f "$workflow"
test -f "$setup_script"
test -f "$instrumented_build_script"
test -f "$dockerfile"
rg --quiet '^name: Linux quality checks$' "$workflow"
rg --quiet '^  contents: read$' "$workflow"
rg --quiet '^    runs-on: ubuntu-22\.04$' "$workflow"
rg --quiet '^      MATIEC_BUILD_JOBS: "1"$' "$workflow"
rg --quiet '^      PLCFUZZ_TOOLCHAIN_BUILD_JOBS: "1"$' "$workflow"
rg --quiet '^        uses: actions/checkout@v5$' "$workflow"
rg --quiet 'submodules: recursive' "$workflow"
rg --quiet 'MATIEC_RUN_TESTS=1 ./scripts/plcfuzz setup' "$workflow"
rg --quiet 'pkg-config python3 ripgrep' "$workflow"
rg --quiet 'check_testcase_manifest\.py --verify-compiler' "$workflow"
rg --quiet 'git clone --branch v5\.03c --depth 1' "$workflow"
rg --quiet 'source-only -j"\$PLCFUZZ_TOOLCHAIN_BUILD_JOBS"' "$workflow"
rg --quiet './scripts/plcfuzz build runtime' "$workflow"
rg --quiet './scripts/plcfuzz build mutator' "$workflow"
rg --quiet './scripts/plcfuzz build instrumented' "$workflow"
rg --quiet './scripts/plcfuzz test unit' "$workflow"
rg --quiet './scripts/plcfuzz test testcases' "$workflow"
if rg --quiet './buildscript\.sh|./runfuzz\.sh' "$workflow"; then
    echo "CI workflow must use the maintained unified command." >&2
    exit 1
fi
rg --quiet '^mkdir -p stage4/\.deps$' "$setup_script"
rg --quiet '^    make check LIBS="\$matiec_dir/compiler/libcompiler\.a"$' "$setup_script"
rg --quiet 'source-only -j1' "$dockerfile"
rg --quiet 'PLCFUZZ_INSTRUMENTED_CXX' "$instrumented_build_script"
rg --quiet 'PLCFUZZ_INSTRUMENTED_CXX=' "$workflow"
if rg --quiet 'AFL_CXX|AFL_BUILD_JOBS' "$workflow" "$instrumented_build_script"; then
    echo "Project build controls must not use upstream-reserved environment names." >&2
    exit 1
fi
if rg --quiet 'contents: write' "$workflow"; then
    echo "CI workflow must not request repository write permission." >&2
    exit 1
fi
if rg --quiet 'actions/checkout@v4' "$workflow"; then
    echo "CI workflow must use the Node.js 24 checkout action line." >&2
    exit 1
fi

echo "PASS Linux CI workflow structure"
