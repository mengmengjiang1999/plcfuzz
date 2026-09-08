#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
build_dir="$repo_root/build/mutator"

cmake -S "$repo_root" -B "$build_dir"
cmake --build "$build_dir" --parallel "${BUILD_JOBS:-2}"

echo "Custom mutator: $build_dir/libplc_mutator.so"
