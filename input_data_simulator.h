#include"ladder.h"
#include<iostream>
#include<vector>

class BoolBlock{
    // IEC_BOOL *buffer_bool_input[BUFFER_SIZE][8]
    // 一个Bool的input可以用64字节的数字表示
    // 一个BoolBlock表示一次的输入
public:
    int cycles;
    unsigned char bool_input[BUFFER_SIZE][8];// 注意：这里需要是无符号的整数
    BoolBlock();
    friend std::istream& operator>>(std::istream& is, BoolBlock& sim);
    void print();
};

class InputDataSimulator{
    std::vector<BoolBlock> input_bool_blocks;
    int current_block_index;
    int current_block_cycle;
public:
    InputDataSimulator();
    void print();
    void add_bool_block(BoolBlock block);
    BoolBlock get_current_bool_block();
};

extern InputDataSimulator INPUT_BOOL_DATA;