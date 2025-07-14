#pragma once

#include <iostream>

#include "ladder.h"

class IntBlock {
    // IEC_INT *buffer_int_input[BUFFER_SIZE][8]
    // 一个Int的input可以用64字节的数字表示
    // 一个IntBlock表示一次的输入
   public:
    int cycles;
    IEC_UINT int_input[BUFFER_SIZE][8];  // 注意：这里需要是无符号的整数
    IntBlock();
    friend std::istream& operator>>(std::istream& is, IntBlock& sim);
    void print();
};