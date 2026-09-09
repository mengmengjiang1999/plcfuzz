#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

instrumented_cxx=${PLC_LAB_INSTRUMENTED_CXX:-}
if [[ -z $instrumented_cxx && -n ${PLCFUZZ_INSTRUMENTED_CXX:-} ]]; then
    echo "Deprecated environment variable PLCFUZZ_INSTRUMENTED_CXX; use PLC_LAB_INSTRUMENTED_CXX." >&2
    instrumented_cxx=$PLCFUZZ_INSTRUMENTED_CXX
fi
instrumented_cxx=${instrumented_cxx:-afl-clang-fast++}

make \
    BUILD_DIR=build/instrumented \
    TARGET=openplc_instrumented \
    CXX="$instrumented_cxx" \
    EXTRA_CXXFLAGS="-O0 -g -Wno-c++11-narrowing"
