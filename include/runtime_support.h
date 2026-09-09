#pragma once

#include <cstdint>

extern unsigned long runtime_tick;

void disableOutputs();

std::uint8_t* bool_input_call_back(int array_index, int bit_index);
std::uint8_t* bool_output_call_back(int array_index, int bit_index);
std::uint8_t* byte_input_call_back(int array_index);
std::uint8_t* byte_output_call_back(int array_index);
std::uint16_t* int_input_call_back(int array_index);
std::uint16_t* int_output_call_back(int array_index);
std::uint32_t* dint_input_call_back(int array_index);
std::uint32_t* dint_output_call_back(int array_index);
std::uint64_t* lint_input_call_back(int array_index);
std::uint64_t* lint_output_call_back(int array_index);
void logger_callback(char* message);
