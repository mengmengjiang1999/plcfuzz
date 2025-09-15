#include <iostream>

#include "basic_buffer_history.h"
#include "ladder.h"

// 下面要定义一些数据结构，记录最近的10次cycle里面的输入和输出的值
// Booleans

class BufferHistory {
   public:
    BoolBufferHistory bool_history;
    ByteBufferHistory byte_history;
    IntBufferHistory int_history;
    DIntBufferHistory dint_history;
    LIntBufferHistory lint_history;
    IntMemoryBufferHistory int_memory_history;
    DIntMemoryBufferHistory dint_memory_history;

    BufferHistory();
    void updateHistory(IEC_BOOL *bool_input[BUFFER_SIZE][8], IEC_BOOL *bool_output[BUFFER_SIZE][8], IEC_BYTE *input_byte[8], IEC_BYTE *output_byte[8],
                       IEC_UINT *input_int[8], IEC_UINT *output_int[8], IEC_UDINT *input_dint[8], IEC_UDINT *output_dint[8],
                       IEC_ULINT *input_lint[8], IEC_ULINT *output_lint[8], IEC_UINT *input_int_memory[8],
                       IEC_UINT *output_int_memory[8], IEC_UDINT *input_dint_memory[8], IEC_UDINT *output_dint_memory[8]);
    // void updateBoolHistory(IEC_BOOL *(*input)[8], IEC_BOOL *(*output)[8]);
    void updateBoolHistory(IEC_BOOL *bool_input[BUFFER_SIZE][8], IEC_BOOL *bool_output[BUFFER_SIZE][8]);
    void updateByteHistory(IEC_BYTE *input[8], IEC_BYTE *output[8]);
    void updateIntHistory(IEC_UINT *input[8], IEC_UINT *output[8]);
    void updateDintHistory(IEC_UDINT *input[8], IEC_UDINT *output[8]);
    void updateLintHistory(IEC_ULINT *input[8], IEC_ULINT *output[8]);
    void updateIntMemoryHistory(IEC_UINT *input[8], IEC_UINT *output[8]);
    void updateDintMemoryHistory(IEC_UDINT *input[8], IEC_UDINT *output[8]);
    bool checkChange();
    void printHistory();
};
