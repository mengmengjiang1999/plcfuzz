#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

make \
    BUILD_DIR=build/fuzz \
    TARGET=openplc_fuzz \
    CXX="${PLCFUZZ_INSTRUMENTED_CXX:-afl-clang-fast++}" \
    EXTRA_CXXFLAGS="-O0 -g -Wno-c++11-narrowing"
