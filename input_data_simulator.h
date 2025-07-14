#include"ladder.h"
#include<iostream>
#include<vector>
#include"bool_block.h"

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