#include <iostream>

#include "basic_buffer_history.h"
#include "ladder.h"

// 下面要定义一些数据结构，记录最近的10次cycle里面的输入和输出的值
// Booleans

class BufferHistory {
   private:
    void updateBoolHistory(IEC_BOOL *bool_input[OPENPLC_BUFFER_SIZE][8],
                           IEC_BOOL *bool_output[OPENPLC_BUFFER_SIZE][8]);
    void updateByteHistory(IEC_BYTE *input[OPENPLC_BUFFER_SIZE], IEC_BYTE *output[OPENPLC_BUFFER_SIZE]);
    void updateIntHistory(IEC_UINT *input[OPENPLC_BUFFER_SIZE], IEC_UINT *output[OPENPLC_BUFFER_SIZE]);
    void updateDintHistory(IEC_UDINT *input[OPENPLC_BUFFER_SIZE], IEC_UDINT *output[OPENPLC_BUFFER_SIZE]);
    void updateLintHistory(IEC_ULINT *input[OPENPLC_BUFFER_SIZE], IEC_ULINT *output[OPENPLC_BUFFER_SIZE]);
    void updateIntMemoryHistory(IEC_UINT *input[OPENPLC_BUFFER_SIZE], IEC_UINT *output[OPENPLC_BUFFER_SIZE]);
    void updateDintMemoryHistory(IEC_UDINT *input[OPENPLC_BUFFER_SIZE], IEC_UDINT *output[OPENPLC_BUFFER_SIZE]);

   public:
    BoolBufferHistory bool_history;
    ByteBufferHistory byte_history;
    IntBufferHistory int_history;
    DIntBufferHistory dint_history;
    LIntBufferHistory lint_history;
    IntMemoryBufferHistory int_memory_history;
    DIntMemoryBufferHistory dint_memory_history;

    BufferHistory();
    void updateHistory(IEC_BOOL *bool_input[OPENPLC_BUFFER_SIZE][8],
                       IEC_BOOL *bool_output[OPENPLC_BUFFER_SIZE][8],
                       IEC_BYTE *input_byte[OPENPLC_BUFFER_SIZE], IEC_BYTE *output_byte[OPENPLC_BUFFER_SIZE],
                       IEC_UINT *input_int[OPENPLC_BUFFER_SIZE], IEC_UINT *output_int[OPENPLC_BUFFER_SIZE],
                       IEC_UDINT *input_dint[OPENPLC_BUFFER_SIZE], IEC_UDINT *output_dint[OPENPLC_BUFFER_SIZE],
                       IEC_ULINT *input_lint[OPENPLC_BUFFER_SIZE], IEC_ULINT *output_lint[OPENPLC_BUFFER_SIZE],
                       IEC_UINT *input_int_memory[OPENPLC_BUFFER_SIZE], IEC_UINT *output_int_memory[OPENPLC_BUFFER_SIZE],
                       IEC_UDINT *input_dint_memory[OPENPLC_BUFFER_SIZE],
                       IEC_UDINT *output_dint_memory[OPENPLC_BUFFER_SIZE]);

    bool checkChange();
    void printHistory();
};
