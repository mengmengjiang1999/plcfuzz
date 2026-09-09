#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
hardware_layer="$repo_root/src/hardware_layer.cpp"

if rg --quiet 'new[[:space:]]+IEC_' "$hardware_layer"; then
    echo "hardware layer still contains per-value dynamic allocation" >&2
    exit 1
fi

if rg --quiet 'pthread_mutex_(lock|unlock)' "$hardware_layer"; then
    echo "hardware layer still manages the buffer mutex manually" >&2
    exit 1
fi

rg --quiet 'RuntimeBufferStorage' "$hardware_layer"
rg --quiet 'PthreadMutexGuard' "$hardware_layer"
rg --quiet 'PLCInputSlot' "$repo_root/include/plc_input_apply.h"
rg --quiet 'std::array' "$repo_root/include/basic_input_block.h"
rg --quiet 'std::array' "$repo_root/include/basic_buffer_history.h"

echo "PASS runtime_ownership_structure"
