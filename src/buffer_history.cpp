#include "buffer_history.h"

// 具体的话，我在ladder里面定义一个数据结构，存储最近10个周期的输出
// 持续输出变化只标记为需要进一步分析的候选异常行为。

// 这个函数需要在每次plccycle的时候都记录
// 调用地点在hardware_layer.cpp这里
BufferHistory::BufferHistory() { std::cout << "InputHistory constructor called." << std::endl; }

// // 这个函数需要在每次更新输入的时候调用一下
// void BufferHistory::updateBoolHistory(IEC_BOOL *(*input)[8], IEC_BOOL *(*output)[8]) {
//     std::cout << "updateBoolHistory called." << std::endl;
//     this->bool_history.update_history(input, output);
// }

void BufferHistory::updateBoolHistory(IEC_BOOL *bool_input[OPENPLC_BUFFER_SIZE][8],
                                      IEC_BOOL *bool_output[OPENPLC_BUFFER_SIZE][8]) {
    // std::cout << "updateBoolHistory called." << std::endl;
    this->bool_history.update_history(bool_input, bool_output);
}

void BufferHistory::updateByteHistory(IEC_BYTE *input[OPENPLC_BUFFER_SIZE], IEC_BYTE *output[OPENPLC_BUFFER_SIZE]) {
    // std::cout << "updateByteHistory called." << std::endl;
    this->byte_history.update_history(input, output);
}

void BufferHistory::updateIntHistory(IEC_UINT *input[OPENPLC_BUFFER_SIZE], IEC_UINT *output[OPENPLC_BUFFER_SIZE]) {
    // std::cout << "updateIntHistory called." << std::endl;
    this->int_history.update_history(input, output);
}

void BufferHistory::updateDintHistory(IEC_UDINT *input[OPENPLC_BUFFER_SIZE], IEC_UDINT *output[OPENPLC_BUFFER_SIZE]) {
    // std::cout << "updateDintHistory called." << std::endl;
    this->dint_history.update_history(input, output);
}

void BufferHistory::updateLintHistory(IEC_ULINT *input[OPENPLC_BUFFER_SIZE], IEC_ULINT *output[OPENPLC_BUFFER_SIZE]) {
    // std::cout << "updateLintHistory called." << std::endl;
    this->lint_history.update_history(input, output);
}

void BufferHistory::updateIntMemoryHistory(IEC_UINT *input[OPENPLC_BUFFER_SIZE], IEC_UINT *output[OPENPLC_BUFFER_SIZE]) {
    // std::cout << "updateIntMemoryHistory called." << std::endl;
    this->int_memory_history.update_history(input, output);
}

void BufferHistory::updateDintMemoryHistory(IEC_UDINT *input[OPENPLC_BUFFER_SIZE], IEC_UDINT *output[OPENPLC_BUFFER_SIZE]) {
    // std::cout << "updateDintMemoryHistory called." << std::endl;
    this->dint_memory_history.update_history(input, output);
}

void BufferHistory::updateHistory(IEC_BOOL *bool_input[OPENPLC_BUFFER_SIZE][8],
                                  IEC_BOOL *bool_output[OPENPLC_BUFFER_SIZE][8],
                                  IEC_BYTE *input_byte[OPENPLC_BUFFER_SIZE],
                                  IEC_BYTE *output_byte[OPENPLC_BUFFER_SIZE],
                                  IEC_UINT *input_int[OPENPLC_BUFFER_SIZE], IEC_UINT *output_int[OPENPLC_BUFFER_SIZE],
                                  IEC_UDINT *input_dint[OPENPLC_BUFFER_SIZE],
                                  IEC_UDINT *output_dint[OPENPLC_BUFFER_SIZE],
                                  IEC_ULINT *input_lint[OPENPLC_BUFFER_SIZE],
                                  IEC_ULINT *output_lint[OPENPLC_BUFFER_SIZE],
                                  IEC_UINT *input_int_memory[OPENPLC_BUFFER_SIZE],
                                  IEC_UINT *output_int_memory[OPENPLC_BUFFER_SIZE],
                                  IEC_UDINT *input_dint_memory[OPENPLC_BUFFER_SIZE],
                                  IEC_UDINT *output_dint_memory[OPENPLC_BUFFER_SIZE]) {
    this->updateBoolHistory(bool_input, bool_output);
    this->updateByteHistory(input_byte, output_byte);
    this->updateIntHistory(input_int, output_int);
    this->updateDintHistory(input_dint, output_dint);
    this->updateLintHistory(input_lint, output_lint);
    this->updateIntMemoryHistory(input_int_memory, output_int_memory);
    this->updateDintMemoryHistory(input_dint_memory, output_dint_memory);
}

bool BufferHistory::checkChange() {
    const bool bool_changed = bool_history.check_change();
    const bool byte_changed = byte_history.check_change();
    const bool int_changed = int_history.check_change();
    const bool dint_changed = dint_history.check_change();
    const bool lint_changed = lint_history.check_change();
    const bool int_memory_changed = int_memory_history.check_change();
    const bool dint_memory_changed = dint_memory_history.check_change();

    std::cout << "Output-change candidate by type:"
              << " bool=" << bool_changed << " byte=" << byte_changed << " int=" << int_changed
              << " dint=" << dint_changed << " lint=" << lint_changed << " int_memory=" << int_memory_changed
              << " dint_memory=" << dint_memory_changed << std::endl;

    return bool_changed || byte_changed || int_changed || dint_changed || lint_changed || int_memory_changed ||
           dint_memory_changed;
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
