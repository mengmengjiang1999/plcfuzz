#pragma once

#include <iostream>

#include "ladder.h"

class BasicInputBlock {
   public:
    int cycles;
    BasicInputBlock() = default;
    virtual void print() {};
};