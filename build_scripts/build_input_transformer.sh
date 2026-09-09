#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
build_dir="$repo_root/build/input-transformer"

cmake -S "$repo_root" -B "$build_dir"
cmake --build "$build_dir" --parallel "${BUILD_JOBS:-2}"

echo "Input transformer: $build_dir/libplc_input_transformer.so"
