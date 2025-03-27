#include"ladder.h"
#include<iostream>
#include<vector>

class BoolBlock{
    // IEC_BOOL *buffer_bool_input[BUFFER_SIZE][8]
    // 一个Bool的input可以用64字节的数字表示
public:
    int cycles;
    std::vector<char> bool_input;
    BoolBlock();
    friend std::istream& operator>>(std::istream& is, BoolBlock& sim);
};

class InputDataSimulator{
    std::vector<BoolBlock> input_bool_blocks;
public:
    InputDataSimulator();
    
};