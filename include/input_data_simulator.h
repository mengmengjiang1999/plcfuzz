#include <iostream>
#include <vector>

#include "basic_input_block.h"
#include "ladder.h"

template <typename T>
class InputDataSimulator {
    std::vector<T> input_blocks;
    int current_block_index;
    int current_block_cycle;

   public:
    InputDataSimulator();
    void print();
    void add_block(T block);
    T get_current_block();
};

extern InputDataSimulator<BoolBlock> INPUT_BOOL_DATA;
extern InputDataSimulator<ByteBlock> INPUT_BYTE_DATA;

template <typename T>
InputDataSimulator<T>::InputDataSimulator() {
    this->current_block_cycle = 0;
    this->current_block_index = 0;
}

template <typename T>
void InputDataSimulator<T>::print() {
    for (int i = 0; i < this->input_blocks.size(); i++) {
        this->input_blocks[i].print();
    }
}

template <typename T>
void InputDataSimulator<T>::add_block(T block) {
    this->input_blocks.push_back(block);
}

template <typename T>
T InputDataSimulator<T>::get_current_block() {
    std::cout << "InputDataSimulator::get_current_block(): " << this->current_block_index
              << ", size=" << this->input_blocks.size() << std::endl;
    T block = this->input_blocks[this->current_block_index];
    // 如果cycle不够这个block的持续cycle的数量那么
    if (this->current_block_cycle < block.cycles) {
        this->current_block_cycle++;
    }
    // 如果cycle已经够了，那么切换到下一个block
    if (this->current_block_cycle == block.cycles) {
        this->current_block_cycle = 0;
        std::cout << "Switch to next block" << std::endl;
        // 如果已经到了最后一个block的数据，那么就不切换了
        if (this->current_block_index < this->input_blocks.size() - 1) {
            this->current_block_index++;
        }
    }
    return block;
}