#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
#include <unistd.h>

#include "mutator_helper.h"

extern "C" {
typedef struct afl_state afl_state_t;
void* afl_custom_init(afl_state_t* afl, unsigned int seed);
size_t afl_custom_fuzz(void* data,
                       uint8_t* buf,
                       size_t buf_size,
                       uint8_t** out_buf,
                       uint8_t* add_buf,
                       size_t add_buf_size,
                       size_t max_size);
void afl_custom_deinit(void* data);
}

namespace {

std::string temporary_mapping_path() {
    return "/tmp/plcfuzz-mutator-test-" + std::to_string(static_cast<long long>(getpid())) + ".csv";
}

void write_mapping(const std::string& path, const std::string& body) {
    std::ofstream output(path.c_str(), std::ios::binary | std::ios::trunc);
    assert(output);
    output << "type,array,bit,name\n" << body;
    assert(output.good());
}

std::string mutate_once(unsigned int seed, const std::string& input, size_t max_size) {
    void* state = afl_custom_init(NULL, seed);
    assert(state != NULL);
    uint8_t* output = reinterpret_cast<uint8_t*>(1);
    const size_t output_size = afl_custom_fuzz(state,
                                               reinterpret_cast<uint8_t*>(const_cast<char*>(input.data())),
                                               input.size(),
                                               &output,
                                               NULL,
                                               0,
                                               max_size);
    std::string result;
    if(output_size != 0) {
        assert(output != NULL);
        result.assign(reinterpret_cast<char*>(output), output_size);
    } else {
        assert(output == NULL);
    }
    afl_custom_deinit(state);
    return result;
}

}  // namespace

int main() {
    const std::string mapping_path = temporary_mapping_path();
    setenv("PLCFUZZ_VARIABLE_MAPPING", mapping_path.c_str(), 1);
    write_mapping(mapping_path,
                  "bool_inputs,0,0,__IX0_0\n"
                  "byte_inputs,0,,__IB0\n"
                  "int_inputs,0,,__IW0\n"
                  "dint_inputs,0,,__ID0\n"
                  "lint_inputs,0,,__IL0\n"
                  "int_memory,0,,__MW0\n"
                  "dint_memory,0,,__MD0\n");

    PLCInputBlock block;
    block.input_bool_block.cycles = 3;
    block.input_byte_block.cycles = 3;
    block.input_int_block.cycles = 3;
    block.input_dint_block.cycles = 3;
    block.input_lint_block.cycles = 3;
    block.input_int_mem_block.cycles = 3;
    block.input_dint_mem_block.cycles = 3;
    block.input_byte_block.input[0] = 17;
    block.input_int_block.input[0] = 1234;
    block.input_dint_block.input[0] = 123456;
    block.input_lint_block.input[0] = 123456789;
    const std::string input = serialize_plc_data(std::vector<PLCInputBlock>(1, block));

    srandom(1);
    const std::string first = mutate_once(12345, input, 1024 * 1024);
    srandom(999);
    const std::string second = mutate_once(12345, input, 1024 * 1024);
    assert(!first.empty());
    assert(first == second);

    bool found_different_seed = false;
    for(unsigned int seed = 1; seed < 10; ++seed) {
        if(mutate_once(seed, input, 1024 * 1024) != first) {
            found_different_seed = true;
            break;
        }
    }
    assert(found_different_seed);

    assert(mutate_once(12345, input, 1).empty());
    assert(mutate_once(12345, "not plc data", 1024).empty());
    assert(unsigned_bit_mask<IEC_UDINT>(31) == 0x80000000U);
    assert(unsigned_bit_mask<IEC_ULINT>(63) == 0x8000000000000000ULL);

    write_mapping(mapping_path, "bool_inputs,nope,0,__IX0_0\n");
    assert(afl_custom_init(NULL, 1) == NULL);
    write_mapping(mapping_path, "bool_inputs,8,0,__IX8_0\n");
    assert(afl_custom_init(NULL, 1) == NULL);
    write_mapping(mapping_path, "bool_inputs,0,0\n");
    assert(afl_custom_init(NULL, 1) == NULL);
    write_mapping(mapping_path, "bool_inputs,0,0,\n");
    assert(afl_custom_init(NULL, 1) == NULL);

    setenv("PLCFUZZ_VARIABLE_MAPPING", "/tmp/plcfuzz-mutator-does-not-exist.csv", 1);
    assert(afl_custom_init(NULL, 1) == NULL);

    unsetenv("PLCFUZZ_VARIABLE_MAPPING");
    void* default_mapping_state = afl_custom_init(NULL, 1);
    assert(default_mapping_state != NULL);
    afl_custom_deinit(default_mapping_state);
    std::remove(mapping_path.c_str());
    return 0;
}
