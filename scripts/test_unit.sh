#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
build_dir=${PLC_LAB_TEST_BUILD_DIR:-"$repo_root/build/tests"}
compiler=${CXX:-c++}
extra_cxxflags=()
extra_ldflags=()
if [[ -n ${PLC_LAB_TEST_CXXFLAGS:-} ]]; then
    read -r -a extra_cxxflags <<< "$PLC_LAB_TEST_CXXFLAGS"
fi
if [[ -n ${PLC_LAB_TEST_LDFLAGS:-} ]]; then
    read -r -a extra_ldflags <<< "$PLC_LAB_TEST_LDFLAGS"
fi

mkdir -p "$build_dir"

compile_and_run() {
    local name=$1
    shift
    local compile_command=(
        "$compiler"
        -std=c++11
        -Wall -Wextra -Werror
        -I"$repo_root/include"
        -I"$repo_root/lib"
        -I"$repo_root/input_generation"
    )
    if [[ ${#extra_cxxflags[@]} -gt 0 ]]; then
        compile_command+=("${extra_cxxflags[@]}")
    fi
    compile_command+=("$@")
    if [[ ${#extra_ldflags[@]} -gt 0 ]]; then
        compile_command+=("${extra_ldflags[@]}")
    fi
    compile_command+=(-o "$build_dir/$name")
    "${compile_command[@]}"
    PLC_LAB_TEST_REPO_ROOT="$repo_root" "$build_dir/$name"
    echo "PASS $name"
}

run_python() {
    if [[ ${PLC_LAB_PYTHON_COVERAGE:-0} == 1 ]]; then
        PYTHONDONTWRITEBYTECODE=1 python3 -m coverage run --append \
            --source="$repo_root/scripts,$repo_root/static_analyse" "$@"
    else
        PYTHONDONTWRITEBYTECODE=1 python3 "$@"
    fi
}

compile_and_run \
    input_transformer_helper_test \
    "$repo_root/tests/input_transformer_helper_test.cpp"

compile_and_run \
    plc_input_simulator_test \
    "$repo_root/tests/plc_input_simulator_test.cpp" \
    "$repo_root/src/plc_input_simulator.cpp"

compile_and_run \
    buffer_history_test \
    "$repo_root/tests/buffer_history_test.cpp"

compile_and_run \
    runtime_ownership_test \
    "$repo_root/tests/runtime_ownership_test.cpp" \
    -pthread

compile_and_run \
    communication_compat_test \
    "$repo_root/tests/communication_compat_test.cpp" \
    "$repo_root/src/communication_compat.cpp"

compile_and_run \
    runtime_timing_test \
    "$repo_root/tests/runtime_timing_test.cpp"

compile_and_run \
    runtime_layers_test \
    "$repo_root/tests/runtime_layers_test.cpp" \
    "$repo_root/src/plc_input_simulator.cpp" \
    "$repo_root/src/runtime_input_application.cpp" \
    "$repo_root/src/runtime_cycle_scheduler.cpp" \
    "$repo_root/src/runtime_result_recorder.cpp"

compile_and_run \
    modbus_dispatch_test \
    "$repo_root/tests/modbus_dispatch_test.cpp" \
    "$repo_root/src/modbus.cpp" \
    "$repo_root/src/modbus_discrete.cpp" \
    "$repo_root/src/modbus_registers.cpp" \
    "$repo_root/src/runtime_buffer_map.cpp" \
    -pthread

compile_and_run \
    plc_input_transformer_test \
    "$repo_root/tests/plc_input_transformer_test.cpp" \
    "$repo_root/input_generation/plc_input_transformer.cpp"

rg --quiet '^start[[:space:]]*=[[:space:]]*format_header bigblocks$' "$repo_root/input_generation/plc.grammar"
rg --quiet '^format_header[[:space:]]*=[[:space:]]*"PLCFUZZ_INPUT_V1"$' "$repo_root/input_generation/plc.grammar"
echo "PASS plc_input_grammar_test"

run_python "$repo_root/tests/testcase_manifest_test.py"
echo "PASS testcase_manifest_test"

run_python "$repo_root/tests/static_analyse_test.py"
echo "PASS static_analyse_test"

run_python "$repo_root/tests/organize_abnormal_samples_test.py"
echo "PASS organize_abnormal_samples_test"

run_python "$repo_root/tests/experiment_manifest_test.py"
echo "PASS experiment_manifest_test"

run_python "$repo_root/tests/evaluation_protocol_test.py"
echo "PASS evaluation_protocol_test"

run_python "$repo_root/tests/benchmark_suite_test.py"
echo "PASS benchmark_suite_test"

run_python "$repo_root/tests/comparison_plan_test.py"
echo "PASS comparison_plan_test"

run_python "$repo_root/tests/experiment_report_test.py"
echo "PASS experiment_report_test"

run_python "$repo_root/tests/coverage_report_test.py"
echo "PASS coverage_report_test"

bash "$repo_root/scripts/check_diagnostics_workflow.sh"
bash "$repo_root/scripts/check_experiment_workflow.sh"
bash "$repo_root/scripts/check_comparison_workflow.sh"
bash "$repo_root/scripts/check_report_workflow.sh"
bash "$repo_root/scripts/check_coverage_workflow.sh"
PYTHONDONTWRITEBYTECODE=1 python3 "$repo_root/scripts/check_license_metadata.py"
bash "$repo_root/scripts/check_entrypoints.sh"
bash "$repo_root/scripts/check_runtime_ownership.sh"
bash "$repo_root/scripts/check_runtime_modules.sh"
bash "$repo_root/scripts/check_container_acceptance.sh"
