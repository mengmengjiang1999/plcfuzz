#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
build_dir="$repo_root/build/tests"
compiler=${CXX:-c++}

mkdir -p "$build_dir"

compile_and_run() {
    local name=$1
    shift
    "$compiler" \
        -std=c++11 \
        -Wall -Wextra -Werror \
        -I"$repo_root/include" \
        -I"$repo_root/lib" \
        -I"$repo_root/fuzz_config" \
        "$@" \
        -o "$build_dir/$name"
    PLCFUZZ_TEST_REPO_ROOT="$repo_root" "$build_dir/$name"
    echo "PASS $name"
}

compile_and_run \
    mutator_helper_test \
    "$repo_root/tests/mutator_helper_test.cpp"

compile_and_run \
    plc_input_simulator_test \
    "$repo_root/tests/plc_input_simulator_test.cpp" \
    "$repo_root/src/plc_input_simulator.cpp"

compile_and_run \
    buffer_history_test \
    "$repo_root/tests/buffer_history_test.cpp"

compile_and_run \
    runtime_timing_test \
    "$repo_root/tests/runtime_timing_test.cpp"

compile_and_run \
    plc_mutator_test \
    "$repo_root/tests/plc_mutator_test.cpp" \
    "$repo_root/fuzz_config/plc_mutator.cpp"

rg --quiet '^start[[:space:]]*=[[:space:]]*format_header bigblocks$' "$repo_root/fuzz_config/plc.grammar"
rg --quiet '^format_header[[:space:]]*=[[:space:]]*"PLCFUZZ_INPUT_V1"$' "$repo_root/fuzz_config/plc.grammar"
echo "PASS plc_input_grammar_test"
