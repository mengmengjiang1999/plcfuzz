#include"ladder.h"
#include<iostream>

static const int MAX_RESULTS = 10;

// 下面要定义一些数据结构，记录最近的10次cycle里面的输入和输出的值

//Booleans

class BufferHistory {
    int current_index_bool_input;
    int current_index_bool_output;
    int current_index_byte;
public:
    IEC_BOOL *buffer_bool_input[BUFFER_SIZE][8][MAX_RESULTS];
    // IEC_BOOL *buffer_bool_output[BUFFER_SIZE][8][MAX_RESULTS];
    IEC_BOOL *buffer_bool_output[BUFFER_SIZE][8][MAX_RESULTS];

    //Bytes
    IEC_BYTE *byte_input_history[BUFFER_SIZE][MAX_RESULTS];
    IEC_BYTE *byte_output_history[BUFFER_SIZE][MAX_RESULTS];

    //Analog I/O
    IEC_UINT *int_input_history[BUFFER_SIZE][MAX_RESULTS];
    IEC_UINT *int_output_history[BUFFER_SIZE][MAX_RESULTS];

    //32bit I/O
    IEC_UDINT *dint_input_history[BUFFER_SIZE][MAX_RESULTS];
    IEC_UDINT *dint_output_history[BUFFER_SIZE][MAX_RESULTS];

    //64bit I/O
    IEC_ULINT *lint_input_history[BUFFER_SIZE][MAX_RESULTS];
    IEC_ULINT *lint_output_history[BUFFER_SIZE][MAX_RESULTS];

    //Memory
    IEC_UINT *int_memory_history[BUFFER_SIZE][MAX_RESULTS];
    IEC_UDINT *dint_memory_history[BUFFER_SIZE][MAX_RESULTS];
    BufferHistory();
    void updateBoolHistory(IEC_BOOL *(*input)[8], IEC_BOOL *(*output)[8]);
    // void updateByteHistory(IEC_BYTE *input, IEC_BYTE *output);
    bool checkChange();
    void printHistory();
};
