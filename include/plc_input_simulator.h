#pragma once
#include "basic_input_block.h"
#include "input_data_simulator.h"
#include "plc_input_block.h"

class PLCInputSimulator {
   public:
    InputDataSimulator<BoolBlock> INPUT_BOOL_DATA;
    InputDataSimulator<ByteBlock> INPUT_BYTE_DATA;
    InputDataSimulator<IntBlock> INPUT_INT_DATA;
    InputDataSimulator<DIntBlock> INPUT_DINT_DATA;
    InputDataSimulator<LIntBlock> INPUT_LINT_DATA;
    InputDataSimulator<IntMemoryBlock> INPUT_INT_MEM_DATA;
    InputDataSimulator<DIntMemoryBlock> INPUT_DINT_MEM_DATA;

    PLCInputSimulator() = default;
    void add_block(const PLCInputBlock& block);
    PLCInputBlock get_current_block();
};
