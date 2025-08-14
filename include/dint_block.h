#pragma once

#include <iostream>

#include "basic_input_block.h"
#include "ladder.h"

class DIntBlock : public BasicInputBlock {
   public:
    IEC_DINT dint_input[BUFFER_SIZE];  // 注意：这里需要是无符号的整数
    DIntBlock() = default;
    friend std::istream& operator>>(std::istream& is, DIntBlock& sim);
    virtual void print();
};