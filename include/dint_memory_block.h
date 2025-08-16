#pragma once

#include <iostream>

#include "basic_input_block.h"
#include "ladder.h"

class DIntMemoryBlock : public BasicInputBlock {
    // IEC_INT *buffer_int_input[BUFFER_SIZE][8]
    // 一个Int的input可以用64字节的数字表示
    // 一个IntBlock表示一次的输入
   public:
    IEC_UDINT dint_memory_input[BUFFER_SIZE];  // 注意：这里需要是无符号的整数
    DIntMemoryBlock() = default;
    friend std::istream& operator>>(std::istream& is, DIntMemoryBlock& sim);
    virtual void print();
};