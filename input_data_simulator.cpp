#include"input_data_simulator.h"

BoolBlock::BoolBlock(){
    this->bool_input.resize(BUFFER_SIZE*8);
}

std::istream& operator>>(std::istream& is,BoolBlock& sim){
    std::cin>>sim.cycles;
    for(int i=0;i<BUFFER_SIZE*8;i++){
        std::cin>>sim.bool_input[i];
    }
}