#pragma once

#include <iostream>

#include "basic_input_block.h"
#include "ladder.h"

class LIntBlock : public BasicInputBlock<IEC_LINT, 1> {
    // IEC_INT *buffer_int_input[BUFFER_SIZE][8]
    // 一个Int的input可以用64字节的数字表示
    // 一个IntBlock表示一次的输入
   public:
    // IEC_LINT lint_input[BUFFER_SIZE];  // 注意：这里需要是无符号的整数
    // LIntBlock() = default;
    // friend std::istream& operator>>(std::istream& is, LIntBlock& sim);
    // virtual void print();
};