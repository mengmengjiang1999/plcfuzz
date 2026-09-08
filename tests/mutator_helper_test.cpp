#include <assert.h>

#include <string>
#include <vector>

#include "mutator_helper.h"

int main() {
    PLCInputBlock original;
    original.input_bool_block.cycles = 3;
    original.input_bool_block.input[0][0] = 1;
    original.input_byte_block.cycles = 4;
    original.input_byte_block.input[1] = 255;
    original.input_int_block.cycles = 5;
    original.input_int_block.input[2] = 65535;
    original.input_dint_block.cycles = 6;
    original.input_dint_block.input[3] = 4000000000U;
    original.input_lint_block.cycles = 7;
    original.input_lint_block.input[4] = 9000000000000ULL;
    original.input_int_mem_block.cycles = 8;
    original.input_int_mem_block.input[5] = 42;
    original.input_dint_mem_block.cycles = 9;
    original.input_dint_mem_block.input[6] = 123456789U;

    const std::vector<PLCInputBlock> input_blocks(1, original);
    const std::string serialized = serialize_plc_data(input_blocks);

    std::vector<PLCInputBlock> parsed;
    assert(parse_plc_data(reinterpret_cast<const uint8_t *>(serialized.data()), serialized.size(), parsed));
    assert(parsed.size() == 1);
    assert(parsed[0].input_bool_block.cycles == 3);
    assert(parsed[0].input_bool_block.input[0][0] == 1);
    assert(parsed[0].input_byte_block.input[1] == 255);
    assert(parsed[0].input_int_block.input[2] == 65535);
    assert(parsed[0].input_dint_block.input[3] == 4000000000U);
    assert(parsed[0].input_lint_block.input[4] == 9000000000000ULL);
    assert(parsed[0].input_int_mem_block.input[5] == 42);
    assert(parsed[0].input_dint_mem_block.input[6] == 123456789U);

    const std::string invalid = "not a PLC input block";
    assert(!parse_plc_data(reinterpret_cast<const uint8_t *>(invalid.data()), invalid.size(), parsed));
    return 0;
}
