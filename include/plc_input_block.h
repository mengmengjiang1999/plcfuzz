#pragma once

#include <iostream>

#include "basic_input_block.h"

class PLCInputBlock {
   public:
    BoolBlock input_bool_block;
    ByteBlock input_byte_block;
    IntBlock input_int_block;
    DIntBlock input_dint_block;
    LIntBlock input_lint_block;
    IntMemoryBlock input_int_mem_block;
    DIntMemoryBlock input_dint_mem_block;
    friend std::istream& operator>>(std::istream& is, PLCInputBlock& plc_input_block) {
        std::cin >> plc_input_block.input_bool_block >> plc_input_block.input_byte_block >> plc_input_block.input_int_block >>
            plc_input_block.input_dint_block >> plc_input_block.input_lint_block >> plc_input_block.input_int_mem_block >>
            plc_input_block.input_dint_mem_block;
        return is;
    }
    virtual std::string serialize_data() const {
        return input_bool_block.serialize_data() + input_byte_block.serialize_data() + input_int_block.serialize_data() +
               input_dint_block.serialize_data() + input_lint_block.serialize_data() + input_int_mem_block.serialize_data() +
               input_dint_mem_block.serialize_data();
    }
    void print() {
        input_bool_block.print();
        input_byte_block.print();
        input_int_block.print();
        input_dint_block.print();
        input_lint_block.print();
        input_int_mem_block.print();
        input_dint_mem_block.print();
    }
};