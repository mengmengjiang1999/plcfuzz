#include "buffer_history.h"

// 具体的话，我在ladder里面定义一个数据结构，存储最近10个周期的输出
// 如果最近100个周期的输出在不停地变动，那么就认为程序产生了崩溃

// 这个函数需要在每次plccycle的时候都记录
// 调用地点在hardware_layer.cpp这里
BufferHistory::BufferHistory() { std::cout << "InputHistory constructor called." << std::endl; }

// // 这个函数需要在每次更新输入的时候调用一下
// void BufferHistory::updateBoolHistory(IEC_BOOL *(*input)[8], IEC_BOOL *(*output)[8]) {
//     std::cout << "updateBoolHistory called." << std::endl;
//     this->bool_history.update_history(input, output);
// }

void BufferHistory::updateBoolHistory(IEC_BOOL *bool_input[BUFFER_SIZE][8], IEC_BOOL *bool_output[BUFFER_SIZE][8]) {
    // std::cout << "updateBoolHistory called." << std::endl;
    this->bool_history.update_history(bool_input, bool_output);
}

void BufferHistory::updateByteHistory(IEC_BYTE *input[8], IEC_BYTE *output[8]) {
    // std::cout << "updateByteHistory called." << std::endl;
    this->byte_history.update_history(input, output);
}

void BufferHistory::updateIntHistory(IEC_UINT *input[8], IEC_UINT *output[8]) {
    // std::cout << "updateIntHistory called." << std::endl;
    this->int_history.update_history(input, output);
}

void BufferHistory::updateDintHistory(IEC_UDINT *input[8], IEC_UDINT *output[8]) {
    // std::cout << "updateDintHistory called." << std::endl;
    this->dint_history.update_history(input, output);
}

void BufferHistory::updateLintHistory(IEC_ULINT *input[8], IEC_ULINT *output[8]) {
    // std::cout << "updateLintHistory called." << std::endl;
    this->lint_history.update_history(input, output);
}

void BufferHistory::updateIntMemoryHistory(IEC_UINT *input[8], IEC_UINT *output[8]) {
    // std::cout << "updateIntMemoryHistory called." << std::endl;
    this->int_memory_history.update_history(input, output);
}

void BufferHistory::updateDintMemoryHistory(IEC_UDINT *input[8], IEC_UDINT *output[8]) {
    // std::cout << "updateDintMemoryHistory called." << std::endl;
    this->dint_memory_history.update_history(input, output);
}

void BufferHistory::updateHistory(IEC_BOOL *bool_input[BUFFER_SIZE][8], IEC_BOOL *bool_output[BUFFER_SIZE][8],
                                  IEC_BYTE *input_byte[8], IEC_BYTE *output_byte[8], IEC_UINT *input_int[8],
                                  IEC_UINT *output_int[8], IEC_UDINT *input_dint[8], IEC_UDINT *output_dint[8],
                                  IEC_ULINT *input_lint[8], IEC_ULINT *output_lint[8], IEC_UINT *input_int_memory[8],
                                  IEC_UINT *output_int_memory[8], IEC_UDINT *input_dint_memory[8],
                                  IEC_UDINT *output_dint_memory[8]) {
    this->updateBoolHistory(bool_input, bool_output);
    this->updateByteHistory(input_byte, output_byte);
    this->updateIntHistory(input_int, output_int);
    this->updateDintHistory(input_dint, output_dint);
    this->updateLintHistory(input_lint, output_lint);
    this->updateIntMemoryHistory(input_int_memory, output_int_memory);
    this->updateDintMemoryHistory(input_dint_memory, output_dint_memory);
}

bool BufferHistory::checkChange() {  // 里面有一个不稳定的就会报错
    std::cout << "BufferHistory::checkChange()" << std::endl;
    std::cout << "bool_history.check_change():" << this->bool_history.check_change() << std::endl;
    std::cout << "byte_history.check_change():" << this->byte_history.check_change() << std::endl;
    std::cout << "int_history.check_change():" << this->int_history.check_change() << std::endl;
    std::cout << "dint_history.check_change():" << this->dint_history.check_change() << std::endl;
    std::cout << "lint_history.check_change():" << this->lint_history.check_change() << std::endl;
    std::cout << "int_memory_history.check_change():" << this->int_memory_history.check_change() << std::endl;
    std::cout << "dint_memory_history.check_change():" << this->dint_memory_history.check_change() << std::endl;
    return this->bool_history.check_change() || this->byte_history.check_change() || this->int_history.check_change() ||
           this->dint_history.check_change() || this->lint_history.check_change() || this->int_memory_history.check_change() ||
           this->dint_memory_history.check_change();
}

void BufferHistory::printHistory() {
    // std::cout << "BufferHistory::printHistory()" << std::endl;
    this->bool_history.print_history();
    this->byte_history.print_history();
    this->int_history.print_history();
    this->dint_history.print_history();
    this->lint_history.print_history();
    this->int_memory_history.print_history();
    this->dint_memory_history.print_history();
}