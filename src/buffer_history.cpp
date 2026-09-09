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

bool BufferHistory::updateHistory(IEC_BOOL *bool_input[OPENPLC_BUFFER_SIZE][8],
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
    if (!buffer_pointers_complete(bool_input, bool_output) || !buffer_pointers_complete(input_byte, output_byte) ||
        !buffer_pointers_complete(input_int, output_int) || !buffer_pointers_complete(input_dint, output_dint) ||
        !buffer_pointers_complete(input_lint, output_lint) ||
        !buffer_pointers_complete(input_int_memory, output_int_memory) ||
        !buffer_pointers_complete(input_dint_memory, output_dint_memory)) {
        return false;
    }

    bool_history.update_history(bool_input, bool_output);
    byte_history.update_history(input_byte, output_byte);
    int_history.update_history(input_int, output_int);
    dint_history.update_history(input_dint, output_dint);
    lint_history.update_history(input_lint, output_lint);
    int_memory_history.update_history(input_int_memory, output_int_memory);
    dint_memory_history.update_history(input_dint_memory, output_dint_memory);
    return true;
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
