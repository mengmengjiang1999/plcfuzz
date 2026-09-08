#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
build_dir="$repo_root/build/tests"
compiler=${CXX:-c++}

mkdir -p "$build_dir"
"$compiler" \
    -std=c++11 \
    -Wall -Wextra -Werror \
    -I"$repo_root/include" \
    -I"$repo_root/lib" \
    -I"$repo_root/fuzz_config" \
    "$repo_root/tests/mutator_helper_test.cpp" \
    -o "$build_dir/mutator_helper_test"

"$build_dir/mutator_helper_test"
