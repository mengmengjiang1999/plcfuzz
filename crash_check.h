#include"ladder.h"
#include<iostream>

static const int MAX_RESULTS = 100;

// 下面要定义一些数据结构，记录最近的100次cycle里面的输入和输出的值

//Booleans


class InputHistory {
    int current_index;
public:
    IEC_BOOL *bool_history[BUFFER_SIZE][8][MAX_RESULTS];
    // IEC_BOOL *bool_output_history[BUFFER_SIZE][8][MAX_RESULTS];

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
    InputHistory();
    void updateHistory(IEC_BOOL *(*arr)[8]);
    bool checkChange();
};
