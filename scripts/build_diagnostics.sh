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

build_transformer() {
    local build_dir="$repo_root/build/diagnostics/input-transformer"
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
        build_transformer
        ;;
    runtime)
        build_runtime
        ;;
    transformer)
        build_transformer
        ;;
    mutator)
        echo "Deprecated diagnostic target: use transformer." >&2
        build_transformer
        ;;
    *)
        echo "Usage: $0 [all|runtime|transformer]" >&2
        exit 2
        ;;
esac
