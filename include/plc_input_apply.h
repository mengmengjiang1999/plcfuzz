#pragma once

#include "ladder.h"
#include "plc_input_block.h"

inline void applyPLCInputBlock(const PLCInputBlock& block,
                               IEC_BOOL* destination_bool[OPENPLC_BUFFER_SIZE][8],
                               IEC_BYTE* destination_byte[OPENPLC_BUFFER_SIZE],
                               IEC_UINT* destination_int[OPENPLC_BUFFER_SIZE],
                               IEC_UDINT* destination_dint[OPENPLC_BUFFER_SIZE],
                               IEC_ULINT* destination_lint[OPENPLC_BUFFER_SIZE],
                               IEC_UINT* destination_int_memory[OPENPLC_BUFFER_SIZE],
                               IEC_UDINT* destination_dint_memory[OPENPLC_BUFFER_SIZE]) {
    for (int i = 0; i < PLC_INPUT_SIZE; ++i) {
        for (int j = 0; j < 8; ++j) {
            *destination_bool[i][j] = static_cast<IEC_BOOL>(block.input_bool_block.input[i][j]);
        }
        *destination_byte[i] = static_cast<IEC_BYTE>(block.input_byte_block.input[i]);
        *destination_int[i] = static_cast<IEC_UINT>(block.input_int_block.input[i]);
        *destination_dint[i] = static_cast<IEC_UDINT>(block.input_dint_block.input[i]);
        *destination_lint[i] = static_cast<IEC_ULINT>(block.input_lint_block.input[i]);
        *destination_int_memory[i] = static_cast<IEC_UINT>(block.input_int_mem_block.input[i]);
        *destination_dint_memory[i] = static_cast<IEC_UDINT>(block.input_dint_mem_block.input[i]);
    }
}
