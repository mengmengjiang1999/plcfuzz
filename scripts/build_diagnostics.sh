#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
mode=${1:-all}
diagnostic_flags="-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer"

build_runtime() {
    make -C "$repo_root" \
        BUILD_DIR=build/diagnostics/runtime/objects \
        TARGET=build/diagnostics/runtime/openplc_diagnostic \
        EXTRA_CXXFLAGS="$diagnostic_flags" \
        EXTRA_LDFLAGS="-fsanitize=address,undefined"
}

build_mutator() {
    local build_dir="$repo_root/build/diagnostics/mutator"
    cmake \
        -S "$repo_root" \
        -B "$build_dir" \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_CXX_FLAGS="$diagnostic_flags" \
        -DCMAKE_SHARED_LINKER_FLAGS="-fsanitize=address,undefined"
    cmake --build "$build_dir" --parallel "${BUILD_JOBS:-2}"
}

case "$mode" in
    all)
        build_runtime
        build_mutator
        ;;
    runtime)
        build_runtime
        ;;
    mutator)
        build_mutator
        ;;
    *)
        echo "Usage: $0 [all|runtime|mutator]" >&2
        exit 2
        ;;
esac
