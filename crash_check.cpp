#include "crash_check.h"


// 具体的话，我在ladder里面定义一个数据结构，存储最近10个周期的输出
// 如果最近100个周期的输出在不停地变动，那么就认为程序产生了崩溃

// 这个函数需要在每次plccycle的时候都记录
// 调用地点在hardware_layer.cpp这里
BufferHistory::BufferHistory(){
    std::cout << "InputHistory constructor called." << std::endl;
    current_index_bool_input=0;
    current_index_byte=0;
        for(int i=0; i<BUFFER_SIZE; i++) {
            for(int j=0; j<8; j++) {
                for(int k=0; k<MAX_RESULTS; k++) {
                    buffer_bool_input[i][j][k] = new IEC_BOOL;
                    buffer_bool_output[i][j][k] = new IEC_BOOL;
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
    // this->printHistory();
}


// 这个函数需要在每次更新输入的时候调用一下
void BufferHistory::updateBoolHistory(IEC_BOOL *(*input)[8], IEC_BOOL *(*output)[8]) {
    // std::cout << "updateBoolHistory called." << std::endl;
    // update input and output history
    for (size_t i = 0; i < BUFFER_SIZE; i++) {
        for (size_t j = 0; j < 8; j++) {
            *buffer_bool_input[i][j][current_index_bool_input] = *input[i][j];
            *buffer_bool_output[i][j][current_index_bool_input] = *output[i][j];
        }
    }
    current_index_bool_input = (current_index_bool_input + 1) % MAX_RESULTS;
}

// void BufferHistory::updateByteHistory(IEC_BYTE *input, IEC_BYTE *output) {
//     // update input and output history
//     for (size_t i = 0; i < BUFFER_SIZE; i++) {
//         *byte_input_history[i][current_index_byte] = *input;
//         *byte_output_history[i][current_index_byte] = *output;
//     }
//     current_index_byte = (current_index_byte + 1) % MAX_RESULTS;
// }


bool BufferHistory::checkChange() {
    // check crash
    int change_count = 0;
    for (size_t i = 1; i < MAX_RESULTS; i++) {
        bool is_crash = false;
        for (size_t j = 0; j < 8; j++) {
            for (size_t k = 0; k < BUFFER_SIZE; k++) {
                if (*buffer_bool_output[k][j][i] != *buffer_bool_output[k][j][i-1]) {
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
    // this->printHistory();
    if (change_count > 0) {
        // crash detected
        // do something
        // std::cout << "Change detected!" <<change_count<< std::endl;
        return true;
    }else {
        // std::cout << "No change detected." << std::endl;
        return false;
    }
}


void BufferHistory::printHistory() {
    // print history
    for (size_t k = 0; k < MAX_RESULTS; k++) {
        std::cout << "Cycle: " << k << std::endl;
        std::cout << "input: "<<std::endl;
        for (size_t i = 0; i < BUFFER_SIZE; i++) {
            for (size_t j = 0; j < 8; j++) {
                std::cout << int(*buffer_bool_input[i][j][k]) << " ";
            }std::cout << std::endl;
        }
        std::cout <<"output:"<< std::endl;
        for (size_t i = 0; i < BUFFER_SIZE; i++) {
            for (size_t j = 0; j < 8; j++) {
                std::cout << int(*buffer_bool_output[i][j][k]) << " ";
            }std::cout << std::endl;
        }
        std::cout << std::endl;
    }
}