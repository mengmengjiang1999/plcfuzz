#include "plc_input_simulator.h"

void PLCInputSimulator::add_block(PLCInputBlock block) {
    INPUT_BOOL_DATA.add_block(block.input_bool_block);
    INPUT_BYTE_DATA.add_block(block.input_byte_block);
    INPUT_INT_DATA.add_block(block.input_int_block);
    INPUT_DINT_DATA.add_block(block.input_dint_block);
    INPUT_LINT_DATA.add_block(block.input_lint_block);
    INPUT_INT_MEM_DATA.add_block(block.input_int_mem_block);
    INPUT_DINT_MEM_DATA.add_block(block.input_dint_mem_block);
}

PLCInputBlock PLCInputSimulator::get_current_block() {
    PLCInputBlock block;
    block.input_bool_block = INPUT_BOOL_DATA.get_current_block();
    block.input_byte_block = INPUT_BYTE_DATA.get_current_block();
    block.input_int_block = INPUT_INT_DATA.get_current_block();
    block.input_dint_block = INPUT_DINT_DATA.get_current_block();
    block.input_lint_block = INPUT_LINT_DATA.get_current_block();
    block.input_int_mem_block = INPUT_INT_MEM_DATA.get_current_block();
    block.input_dint_mem_block = INPUT_DINT_MEM_DATA.get_current_block();
    return block;
}