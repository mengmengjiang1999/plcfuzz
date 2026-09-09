#include <assert.h>

#include <cstdlib>
#include <fstream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

#include "input_transformer_helper.h"

namespace {

bool parse_text(const std::string& input,
                std::vector<PLCInputBlock>& blocks,
                PLCInputFormat* format = NULL) {
    return parse_plc_data(reinterpret_cast<const uint8_t*>(input.data()), input.size(), blocks, format);
}

std::vector<std::string> split_tokens(const std::string& input) {
    std::istringstream stream(input);
    std::vector<std::string> tokens;
    std::string token;
    while(stream >> token) {
        tokens.push_back(token);
    }
    return tokens;
}

std::string join_tokens(const std::vector<std::string>& tokens) {
    std::string output;
    for(std::size_t i = 0; i < tokens.size(); ++i) {
        if(i != 0) {
            output.push_back(' ');
        }
        output += tokens[i];
    }
    output.push_back('\n');
    return output;
}

}  // namespace

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
    const std::vector<std::string> serialized_tokens = split_tokens(serialized);
    assert(serialized_tokens.size() == PLC_INPUT_FIELDS_PER_RECORD + 1);
    assert(serialized_tokens[0] == PLC_INPUT_FORMAT_V1_HEADER);
    assert(serialized[serialized.size() - 1] == '\n');

    std::vector<PLCInputBlock> parsed;
    PLCInputFormat format = PLCInputFormat::Legacy;
    assert(parse_text(serialized, parsed, &format));
    assert(format == PLCInputFormat::V1);
    assert(parsed.size() == 1);
    assert(parsed[0].input_bool_block.cycles == 3);
    assert(parsed[0].input_bool_block.input[0][0] == 1);
    assert(parsed[0].input_byte_block.input[1] == 255);
    assert(parsed[0].input_int_block.input[2] == 65535);
    assert(parsed[0].input_dint_block.input[3] == 4000000000U);
    assert(parsed[0].input_lint_block.input[4] == 9000000000000ULL);
    assert(parsed[0].input_int_mem_block.input[5] == 42);
    assert(parsed[0].input_dint_mem_block.input[6] == 123456789U);

    const std::vector<PLCInputBlock> two_blocks(2, original);
    assert(parse_text(serialize_plc_data(two_blocks), parsed, &format));
    assert(format == PLCInputFormat::V1);
    assert(parsed.size() == 2);

    const std::string legacy = serialize_plc_data(input_blocks, PLCInputFormat::Legacy);
    assert(parse_text(legacy, parsed, &format));
    assert(format == PLCInputFormat::Legacy);
    assert(parsed.size() == 1);

    const char* repo_root = std::getenv("PLC_LAB_TEST_REPO_ROOT");
    assert(repo_root != NULL);
    const std::string seed_path = std::string(repo_root) + "/seeds copy/seed_0";
    std::ifstream seed_file(seed_path.c_str(), std::ios::binary);
    assert(seed_file.good());
    const std::string preserved_seed((std::istreambuf_iterator<char>(seed_file)),
                                     std::istreambuf_iterator<char>());
    assert(parse_text(preserved_seed, parsed, &format));
    assert(format == PLCInputFormat::Legacy);
    assert(parsed.size() == 2);

    assert(!parse_text("PLCFUZZ_INPUT_V2\n" + legacy, parsed));
    assert(!parse_text("not-a-record", parsed));
    assert(!parse_text("", parsed));

    std::vector<std::string> invalid_tokens = serialized_tokens;
    invalid_tokens.pop_back();
    assert(!parse_text(join_tokens(invalid_tokens), parsed));

    invalid_tokens = serialized_tokens;
    invalid_tokens[67] = "256";
    assert(!parse_text(join_tokens(invalid_tokens), parsed));

    invalid_tokens = serialized_tokens;
    invalid_tokens[1] = "2147483648";
    assert(!parse_text(join_tokens(invalid_tokens), parsed));

    invalid_tokens = serialized_tokens;
    invalid_tokens[1] = "-1";
    assert(!parse_text(join_tokens(invalid_tokens), parsed));

    assert(!parse_text(serialized + "extra\n", parsed));
    assert(serialize_plc_data(std::vector<PLCInputBlock>()).empty());
    return 0;
}
