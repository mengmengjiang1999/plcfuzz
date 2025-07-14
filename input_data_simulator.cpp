#include"input_data_simulator.h"

#include <limits> // 用于获取类型范围
#include <iostream> // 用于输出

BoolBlock::BoolBlock(){
}

void BoolBlock::print(){
    std::cout<<"BoolBlock::print():"<<std::endl;
    std::cout<<"Cycles: "<<this->cycles<<std::endl;
    for(int i=0;i<BUFFER_SIZE;i++){
        for(int j=0;j<8;j++){
            std::cout<<static_cast<unsigned int>(this->bool_input[i][j])<<" ";
        }
    }
    std::cout<<std::endl;
}

// 重载了operator
// 假设输入数据就是一个int类型的cycle+BUFFER_SIZE*8个unsigned char类型的数据
std::istream& operator>>(std::istream& is,BoolBlock& sim){
    std::cout<<"operator>>(std::istream& is,BoolBlock& sim)"<<std::endl;
    printf("Inputs: \n");
    is>>sim.cycles;
    printf("Cycles: %d \n",sim.cycles);
    std::cout<<"BUFFER_SIZE: "<<BUFFER_SIZE<<std::endl;
    std::cout<<static_cast<unsigned int>(std::numeric_limits<unsigned char>::max())<<std::endl;
    for(int i=0;i<BUFFER_SIZE*8;i++){
        unsigned int temp;
        is>>temp;
        std::cout<<i<<" "<<temp<<" ";
        if(temp<=static_cast<unsigned int>(std::numeric_limits<unsigned char>::max()))
            sim.bool_input[i/8][i%8]=temp;
        else
            sim.bool_input[i/8][i%8]=0;
        printf("%d \n",sim.bool_input[i/8][i%8]);
    }
        // 检查行尾是否有额外数据
    if (is.peek() == '\n') {
        is.ignore();  // 忽略换行符
    } else if (!is.eof()) {
        std::cerr << "警告：行尾有多余数据\n";
        is.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    }
    // 重要：返回值是is
    return is;
}

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