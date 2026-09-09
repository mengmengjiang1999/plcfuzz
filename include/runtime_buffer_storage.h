#pragma once

#include <array>
#include <cstddef>

#include "ladder.h"

class RuntimeBufferStorage {
   public:
    void attach_missing(IEC_BOOL* bool_inputs[OPENPLC_BUFFER_SIZE][8],
                        IEC_BOOL* bool_outputs[OPENPLC_BUFFER_SIZE][8],
                        IEC_BYTE* byte_inputs[OPENPLC_BUFFER_SIZE], IEC_BYTE* byte_outputs[OPENPLC_BUFFER_SIZE],
                        IEC_UINT* int_inputs[OPENPLC_BUFFER_SIZE], IEC_UINT* int_outputs[OPENPLC_BUFFER_SIZE],
                        IEC_UDINT* dint_inputs[OPENPLC_BUFFER_SIZE], IEC_UDINT* dint_outputs[OPENPLC_BUFFER_SIZE],
                        IEC_ULINT* lint_inputs[OPENPLC_BUFFER_SIZE], IEC_ULINT* lint_outputs[OPENPLC_BUFFER_SIZE],
                        IEC_UINT* int_memories[OPENPLC_BUFFER_SIZE], IEC_UDINT* dint_memories[OPENPLC_BUFFER_SIZE],
                        IEC_ULINT* lint_memories[OPENPLC_BUFFER_SIZE]) {
        attach_bits(bool_inputs, bool_inputs_);
        attach_bits(bool_outputs, bool_outputs_);
        attach_values(byte_inputs, byte_inputs_);
        attach_values(byte_outputs, byte_outputs_);
        attach_values(int_inputs, int_inputs_);
        attach_values(int_outputs, int_outputs_);
        attach_values(dint_inputs, dint_inputs_);
        attach_values(dint_outputs, dint_outputs_);
        attach_values(lint_inputs, lint_inputs_);
        attach_values(lint_outputs, lint_outputs_);
        attach_values(int_memories, int_memories_);
        attach_values(dint_memories, dint_memories_);
        attach_values(lint_memories, lint_memories_);
    }

   private:
    template <typename T>
    using Values = std::array<T, OPENPLC_BUFFER_SIZE>;

    template <typename T>
    using Bits = std::array<std::array<T, 8>, OPENPLC_BUFFER_SIZE>;

    template <typename T>
    static void attach_values(T* pointers[OPENPLC_BUFFER_SIZE], Values<T>& values) {
        for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
            if (pointers[slot] == nullptr) {
                pointers[slot] = &values[slot];
            }
        }
    }

    template <typename T>
    static void attach_bits(T* pointers[OPENPLC_BUFFER_SIZE][8], Bits<T>& values) {
        for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
            for (std::size_t bit = 0; bit < 8; ++bit) {
                if (pointers[slot][bit] == nullptr) {
                    pointers[slot][bit] = &values[slot][bit];
                }
            }
        }
    }

    Bits<IEC_BOOL> bool_inputs_{};
    Bits<IEC_BOOL> bool_outputs_{};
    Values<IEC_BYTE> byte_inputs_{};
    Values<IEC_BYTE> byte_outputs_{};
    Values<IEC_UINT> int_inputs_{};
    Values<IEC_UINT> int_outputs_{};
    Values<IEC_UDINT> dint_inputs_{};
    Values<IEC_UDINT> dint_outputs_{};
    Values<IEC_ULINT> lint_inputs_{};
    Values<IEC_ULINT> lint_outputs_{};
    Values<IEC_UINT> int_memories_{};
    Values<IEC_UDINT> dint_memories_{};
    Values<IEC_ULINT> lint_memories_{};
};
