#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

test "$(wc -l < "$repo_root/src/main.cpp")" -lt 50
test "$(wc -l < "$repo_root/src/modbus.cpp")" -lt 100
test "$(wc -l < "$repo_root/src/offline_runtime.cpp")" -lt 300
test "$(wc -l < "$repo_root/src/modbus_discrete.cpp")" -lt 300
test "$(wc -l < "$repo_root/src/modbus_registers.cpp")" -lt 450

rg --quiet 'offline_runtime::run\(argc, argv\)' "$repo_root/src/main.cpp"
if rg --quiet 'parse_plc_data|BufferHistory|clock_gettime|pthread_mutex' "$repo_root/src/main.cpp"; then
    echo "Runtime entry point contains a layer implementation." >&2
    exit 1
fi

rg --quiet 'parse_plc_data' "$repo_root/src/runtime_input_application.cpp"
rg --quiet 'RuntimeCycleScheduler::finish_cycle' "$repo_root/src/runtime_cycle_scheduler.cpp"
rg --quiet 'RuntimeResultRecorder::record' "$repo_root/src/runtime_result_recorder.cpp"
rg --quiet 'BufferHistory history_' "$repo_root/include/runtime_state_observer.h"
rg --quiet 'runtimeInputApplication\(\)\.next_block' "$repo_root/src/hardware_layer.cpp"
rg --quiet 'runtimeStateObserver\(\)\.observe' "$repo_root/src/hardware_layer.cpp"
if rg --quiet 'BufferHistory' "$repo_root/src/hardware_layer.cpp"; then
    echo "Offline hardware adapter owns state history directly." >&2
    exit 1
fi

rg --quiet '^int processModbusMessage' "$repo_root/src/modbus.cpp"
rg --quiet '^void ReadCoils' "$repo_root/src/modbus_discrete.cpp"
rg --quiet '^void ReadHoldingRegisters' "$repo_root/src/modbus_registers.cpp"
rg --quiet '^void mapUnusedIO' "$repo_root/src/runtime_buffer_map.cpp"

rg --quiet '^PROJECT_CPP_SRCS[[:space:]]*:=' "$repo_root/Makefile"
rg --quiet '^GENERATED_C_SRCS[[:space:]]*:=' "$repo_root/Makefile"
rg --quiet '^GENERATED_CPP_SRCS[[:space:]]*:=' "$repo_root/Makefile"
rg --quiet '^PROJECT_WARNING_FLAGS[[:space:]]*\?=' "$repo_root/Makefile"
rg --quiet '^GENERATED_WARNING_FLAGS[[:space:]]*\?=' "$repo_root/Makefile"
rg --quiet '\$\(CXX\) \$\(PROJECT_CXXFLAGS\) -c' "$repo_root/Makefile"
rg --quiet '\$\(CXX\) \$\(GENERATED_CXXFLAGS\) -c' "$repo_root/Makefile"
rg --quiet -- '-isystem \./lib -isystem \$\(PLCLOGIC_DIR\)' "$repo_root/Makefile"

echo "PASS modular offline runtime structure"
