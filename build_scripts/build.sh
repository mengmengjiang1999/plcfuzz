#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

if [[ ${1:-} == "-f" ]]; then
    exec "$repo_root/build_scripts/build_instrumented.sh"
fi

make BUILD_DIR=build/runtime TARGET=openplc CXX="${CXX:-g++}"
