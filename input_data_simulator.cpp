#include"input_data_simulator.h"

#include <limits> // 用于获取类型范围
#include <iostream> // 用于输出

// 下面开始写InputDataSimulator类

InputDataSimulator::InputDataSimulator(){
    this->current_block_cycle=0;
    this->current_block_index=0;
}

void InputDataSimulator::print(){
    for(int i=0;i<this->input_bool_blocks.size();i++){
        this->input_bool_blocks[i].print();
    }
}

void InputDataSimulator::add_bool_block(BoolBlock block){
    this->input_bool_blocks.push_back(block);
}

BoolBlock InputDataSimulator::get_current_bool_block(){
    std::cout<<"InputDataSimulator::get_current_bool_block():"<<std::endl;
    BoolBlock block=this->input_bool_blocks[this->current_block_index];
    // 如果cycle不够这个block的持续cycle的数量那么
    if(this->current_block_cycle<block.cycles){
        this->current_block_cycle++;
    }
    // 如果cycle已经够了，那么切换到下一个block
    if(this->current_block_cycle==block.cycles){
        this->current_block_cycle=0;
        std::cout<<"Switch to next block"<<std::endl;
        // 如果已经到了最后一个block，那么就不切换了
        if(this->current_block_index<this->input_bool_blocks.size()-1){
            this->current_block_index++;
        }
    }
    return block;
}