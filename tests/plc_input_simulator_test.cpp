#include <assert.h>

#include <stdexcept>

#include "input_data_simulator.h"
#include "plc_input_apply.h"
#include "plc_input_simulator.h"

namespace {

static_assert(OPENPLC_BUFFER_SIZE == 1024, "OpenPLC glue compatibility requires 1024 runtime slots");
static_assert(PLC_INPUT_SIZE == 8, "The serialized fuzz input model requires eight slots");
static_assert(sizeof(IntBlock().input) / sizeof(IEC_UINT) == PLC_INPUT_SIZE,
              "Input blocks must use the fuzz input capacity");

PLCInputBlock make_block(int cycles, unsigned int base) {
    PLCInputBlock block;
    block.input_bool_block.cycles = cycles;
    block.input_byte_block.cycles = cycles;
    block.input_int_block.cycles = cycles;
    block.input_dint_block.cycles = cycles;
    block.input_lint_block.cycles = cycles;
    block.input_int_mem_block.cycles = cycles;
    block.input_dint_mem_block.cycles = cycles;

    block.input_bool_block.input[0][0] = static_cast<unsigned char>(base % 2);
    block.input_byte_block.input[0] = static_cast<IEC_BYTE>(base + 1);
    block.input_int_block.input[0] = static_cast<IEC_UINT>(base + 2);
    block.input_dint_block.input[0] = static_cast<IEC_UDINT>(base + 100000);
    block.input_lint_block.input[0] = static_cast<IEC_ULINT>(base + 10000000000ULL);
    block.input_int_mem_block.input[0] = static_cast<IEC_UINT>(base + 3);
    block.input_dint_mem_block.input[0] = static_cast<IEC_UDINT>(base + 200000);
    return block;
}

void test_empty_playback_fails_explicitly() {
    InputDataSimulator<IntBlock> simulator;
    bool caught = false;
    try {
        simulator.get_current_block();
    } catch (const std::out_of_range&) {
        caught = true;
    }
    assert(caught);
}

void test_block_duration_and_final_hold() {
    InputDataSimulator<IntBlock> simulator;
    IntBlock first;
    first.cycles = 2;
    first.input[0] = 11;
    IntBlock second;
    second.cycles = 1;
    second.input[0] = 22;
    simulator.add_block(first);
    simulator.add_block(second);

    assert(simulator.get_current_block().input[0] == 11);
    assert(simulator.get_current_block().input[0] == 11);
    assert(simulator.get_current_block().input[0] == 22);
    assert(simulator.get_current_block().input[0] == 22);
}

void test_composite_snapshot_advances_once() {
    PLCInputSimulator simulator;
    const PLCInputBlock first = make_block(2, 10);
    const PLCInputBlock second = make_block(1, 20);
    simulator.add_block(first);
    simulator.add_block(second);

    const PLCInputBlock snapshot1 = simulator.get_current_block();
    const PLCInputBlock snapshot2 = simulator.get_current_block();
    const PLCInputBlock snapshot3 = simulator.get_current_block();

    assert(snapshot1.input_byte_block.input[0] == 11);
    assert(snapshot2.input_byte_block.input[0] == 11);
    assert(snapshot3.input_byte_block.input[0] == 21);
    assert(snapshot2.input_dint_block.input[0] == 100010U);
    assert(snapshot3.input_dint_block.input[0] == 100020U);
}

void test_type_correct_application() {
    const PLCInputBlock block = make_block(1, 40);

    IEC_BOOL bool_values[OPENPLC_BUFFER_SIZE][8] = {};
    IEC_BYTE byte_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_UINT int_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_UDINT dint_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_ULINT lint_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_UINT int_memory_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_UDINT dint_memory_values[OPENPLC_BUFFER_SIZE] = {};

    IEC_BOOL* bool_destinations[OPENPLC_BUFFER_SIZE][8];
    IEC_BYTE* byte_destinations[OPENPLC_BUFFER_SIZE];
    IEC_UINT* int_destinations[OPENPLC_BUFFER_SIZE];
    IEC_UDINT* dint_destinations[OPENPLC_BUFFER_SIZE];
    IEC_ULINT* lint_destinations[OPENPLC_BUFFER_SIZE];
    IEC_UINT* int_memory_destinations[OPENPLC_BUFFER_SIZE];
    IEC_UDINT* dint_memory_destinations[OPENPLC_BUFFER_SIZE];

    for (int i = 0; i < OPENPLC_BUFFER_SIZE; ++i) {
        for (int j = 0; j < 8; ++j) {
            bool_destinations[i][j] = &bool_values[i][j];
        }
        byte_destinations[i] = &byte_values[i];
        int_destinations[i] = &int_values[i];
        dint_destinations[i] = &dint_values[i];
        lint_destinations[i] = &lint_values[i];
        int_memory_destinations[i] = &int_memory_values[i];
        dint_memory_destinations[i] = &dint_memory_values[i];
    }

    assert(applyPLCInputBlock(block,
                              bool_destinations,
                              byte_destinations,
                              int_destinations,
                              dint_destinations,
                              lint_destinations,
                              int_memory_destinations,
                              dint_memory_destinations));

    assert(byte_values[0] == 41);
    assert(int_values[0] == 42);
    assert(dint_values[0] == 100040U);
    assert(lint_values[0] == 10000000040ULL);
    assert(int_memory_values[0] == 43);
    assert(dint_memory_values[0] == 200040U);
}

}  // namespace

int main() {
    test_empty_playback_fails_explicitly();
    test_block_duration_and_final_hold();
    test_composite_snapshot_advances_once();
    test_type_correct_application();
    return 0;
}
