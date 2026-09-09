#pragma once

#include "ladder.h"
#include "plc_input_block.h"
#include "plc_runtime_address.h"

inline bool applyPLCInputBlock(const PLCInputBlock& block,
                               IEC_BOOL* destination_bool[OPENPLC_BUFFER_SIZE][8],
                               IEC_BYTE* destination_byte[OPENPLC_BUFFER_SIZE],
                               IEC_UINT* destination_int[OPENPLC_BUFFER_SIZE],
                               IEC_UDINT* destination_dint[OPENPLC_BUFFER_SIZE],
                               IEC_ULINT* destination_lint[OPENPLC_BUFFER_SIZE],
                               IEC_UINT* destination_int_memory[OPENPLC_BUFFER_SIZE],
                               IEC_UDINT* destination_dint_memory[OPENPLC_BUFFER_SIZE]) {
    for (std::size_t slot_index = 0; slot_index < PLC_INPUT_SIZE; ++slot_index) {
        const PLCInputSlot slot = PLCInputSlot::from_index(slot_index);
        for (std::size_t bit_index = 0; bit_index < 8; ++bit_index) {
            const PLCBitOffset bit = PLCBitOffset::from_index(bit_index);
            if (destination_bool[slot.value()][bit.value()] == nullptr) {
                return false;
            }
        }
        if (destination_byte[slot.value()] == nullptr || destination_int[slot.value()] == nullptr ||
            destination_dint[slot.value()] == nullptr || destination_lint[slot.value()] == nullptr ||
            destination_int_memory[slot.value()] == nullptr || destination_dint_memory[slot.value()] == nullptr) {
            return false;
        }
    }

    for (std::size_t slot_index = 0; slot_index < PLC_INPUT_SIZE; ++slot_index) {
        const PLCInputSlot slot = PLCInputSlot::from_index(slot_index);
        for (std::size_t bit_index = 0; bit_index < 8; ++bit_index) {
            const PLCBitOffset bit = PLCBitOffset::from_index(bit_index);
            *destination_bool[slot.value()][bit.value()] =
                static_cast<IEC_BOOL>(block.input_bool_block.input[slot.value()][bit.value()]);
        }
        *destination_byte[slot.value()] = static_cast<IEC_BYTE>(block.input_byte_block.input[slot.value()]);
        *destination_int[slot.value()] = static_cast<IEC_UINT>(block.input_int_block.input[slot.value()]);
        *destination_dint[slot.value()] = static_cast<IEC_UDINT>(block.input_dint_block.input[slot.value()]);
        *destination_lint[slot.value()] = static_cast<IEC_ULINT>(block.input_lint_block.input[slot.value()]);
        *destination_int_memory[slot.value()] = static_cast<IEC_UINT>(block.input_int_mem_block.input[slot.value()]);
        *destination_dint_memory[slot.value()] =
            static_cast<IEC_UDINT>(block.input_dint_mem_block.input[slot.value()]);
    }
    return true;
}
