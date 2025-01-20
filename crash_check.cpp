#include "crash_check.h"


// 具体的话，我在ladder里面定义一个数据结构，存储最近100个周期的输出
// 如果最近100个周期的输出在不停地变动，那么就认为程序产生了崩溃

// 这个函数需要在每次plccycle的时候都记录
// 调用地点在hardware_layer.cpp这里
InputHistory::InputHistory(){
    current_index=0;
        for(int i=0; i<BUFFER_SIZE; i++) {
            for(int j=0; j<8; j++) {
                for(int k=0; k<MAX_RESULTS; k++) {
                    bool_history[i][j][k] = new IEC_BOOL;
                }
            }
            for(int k=0; k<MAX_RESULTS; k++) {
                byte_input_history[i][k] = new IEC_BYTE;
                byte_output_history[i][k] = new IEC_BYTE;   
            }
            for(int k=0; k<MAX_RESULTS; k++) {
                int_input_history[i][k] = new IEC_UINT;
                int_output_history[i][k] = new IEC_UINT;
            }
            for(int k=0; k<MAX_RESULTS; k++) {
                dint_input_history[i][k] = new IEC_UDINT;
                dint_output_history[i][k] = new IEC_UDINT;
            }

            for(int k=0; k<MAX_RESULTS; k++) {
                lint_input_history[i][k] = new IEC_ULINT;
                lint_output_history[i][k] = new IEC_ULINT;
            }
            for(int k=0; k<MAX_RESULTS; k++) {
                int_memory_history[i][k] = new IEC_UINT;
                dint_memory_history[i][k] = new IEC_UDINT;
            }
        }
    }


// 这个函数需要在每次更新输入的时候调用一下
void InputHistory::updateHistory(IEC_BOOL *(*arr)[8]) {
    // update input and output history
    for (size_t i = 0; i < BUFFER_SIZE; i++) {
        for (size_t j = 0; j < 8; j++) {
            *bool_history[i][j][current_index] = *arr[i][j];
        }
    }
    current_index = (current_index + 1) % MAX_RESULTS;
}

bool InputHistory::checkChange() {
    // check crash
    int change_count = 0;
    for (size_t i = 1; i < BUFFER_SIZE; i++) {
        bool is_crash = false;
        for (size_t j = 0; j < 8; j++) {
            for (size_t k = 0; k < MAX_RESULTS; k++) {
                if (*bool_history[i][j][k] != *bool_history[i-1][j][k]) {
                    is_crash = true;
                    break;
                }
            }
            if (is_crash) {
                break;
            }
        }
        if (is_crash) {
            change_count++;
        }
    }
    if (change_count > 0) {
        // crash detected
        // do something
        std::cout << "Change detected!" <<change_count<< std::endl;
        return true;
    }else {
        std::cout << "No change detected." << std::endl;
        return false;
    }
}

