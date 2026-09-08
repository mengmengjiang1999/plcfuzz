#pragma once

#include <stdint.h>

#include <climits>
#include <limits>
#include <sstream>
#include <string>
#include <vector>

#include "plc_input_block.h"

enum class PLCInputFormat {
    Legacy,
    V1,
};

static const char PLC_INPUT_FORMAT_V1_HEADER[] = "PLCFUZZ_INPUT_V1";
static const char PLC_INPUT_FORMAT_HEADER_PREFIX[] = "PLCFUZZ_INPUT_";
static const std::size_t PLC_INPUT_FIELDS_PER_RECORD = 119;

inline bool parse_unsigned_decimal(const std::string& token, uint64_t& value) {
    if(token.empty()) {
        return false;
    }

    value = 0;
    for(std::size_t i = 0; i < token.size(); ++i) {
        const unsigned char character = static_cast<unsigned char>(token[i]);
        if(character < '0' || character > '9') {
            return false;
        }

        const uint64_t digit = static_cast<uint64_t>(character - '0');
        if(value > (std::numeric_limits<uint64_t>::max() - digit) / 10) {
            return false;
        }
        value = value * 10 + digit;
    }
    return true;
}

template <typename T>
inline bool parse_unsigned_field(const std::vector<std::string>& tokens, std::size_t& index, T& destination) {
    if(index >= tokens.size()) {
        return false;
    }

    uint64_t value = 0;
    if(!parse_unsigned_decimal(tokens[index++], value) || value > std::numeric_limits<T>::max()) {
        return false;
    }
    destination = static_cast<T>(value);
    return true;
}

inline bool parse_cycle_field(const std::vector<std::string>& tokens, std::size_t& index, int& destination) {
    if(index >= tokens.size()) {
        return false;
    }

    uint64_t value = 0;
    if(!parse_unsigned_decimal(tokens[index++], value) || value > static_cast<uint64_t>(INT_MAX)) {
        return false;
    }
    destination = static_cast<int>(value);
    return true;
}

template <typename T>
inline bool parse_scalar_input_block(const std::vector<std::string>& tokens,
                                     std::size_t& index,
                                     BasicInputBlock<T, 1>& block) {
    if(!parse_cycle_field(tokens, index, block.cycles)) {
        return false;
    }
    for(int i = 0; i < PLC_INPUT_SIZE; ++i) {
        if(!parse_unsigned_field(tokens, index, block.input[i])) {
            return false;
        }
    }
    return true;
}

template <typename T>
inline bool parse_matrix_input_block(const std::vector<std::string>& tokens,
                                     std::size_t& index,
                                     BasicInputBlock<T, 2>& block) {
    if(!parse_cycle_field(tokens, index, block.cycles)) {
        return false;
    }
    for(int i = 0; i < PLC_INPUT_SIZE; ++i) {
        for(int j = 0; j < 8; ++j) {
            if(!parse_unsigned_field(tokens, index, block.input[i][j])) {
                return false;
            }
        }
    }
    return true;
}

inline bool parse_plc_input_record(const std::vector<std::string>& tokens,
                                   std::size_t& index,
                                   PLCInputBlock& block) {
    return parse_matrix_input_block(tokens, index, block.input_bool_block) &&
           parse_scalar_input_block(tokens, index, block.input_byte_block) &&
           parse_scalar_input_block(tokens, index, block.input_int_block) &&
           parse_scalar_input_block(tokens, index, block.input_dint_block) &&
           parse_scalar_input_block(tokens, index, block.input_lint_block) &&
           parse_scalar_input_block(tokens, index, block.input_int_mem_block) &&
           parse_scalar_input_block(tokens, index, block.input_dint_mem_block);
}

inline bool parse_plc_data(const uint8_t* data,
                           std::size_t size,
                           std::vector<PLCInputBlock>& blocks,
                           PLCInputFormat* detected_format = NULL) {
    blocks.clear();
    if(data == NULL || size == 0) {
        return false;
    }

    const std::string input(reinterpret_cast<const char*>(data), size);
    std::istringstream stream(input);
    std::vector<std::string> tokens;
    std::string token;
    while(stream >> token) {
        tokens.push_back(token);
    }
    if(tokens.empty()) {
        return false;
    }

    PLCInputFormat format = PLCInputFormat::Legacy;
    std::size_t index = 0;
    if(tokens[0] == PLC_INPUT_FORMAT_V1_HEADER) {
        format = PLCInputFormat::V1;
        index = 1;
    } else if(tokens[0].compare(0, sizeof(PLC_INPUT_FORMAT_HEADER_PREFIX) - 1,
                                PLC_INPUT_FORMAT_HEADER_PREFIX) == 0) {
        return false;
    }

    const std::size_t remaining_fields = tokens.size() - index;
    if(remaining_fields == 0 || remaining_fields % PLC_INPUT_FIELDS_PER_RECORD != 0) {
        return false;
    }

    while(index < tokens.size()) {
        PLCInputBlock block;
        if(!parse_plc_input_record(tokens, index, block)) {
            blocks.clear();
            return false;
        }
        blocks.push_back(block);
    }

    if(detected_format != NULL) {
        *detected_format = format;
    }
    return true;
}

inline std::string serialize_plc_data(const std::vector<PLCInputBlock>& blocks,
                                      PLCInputFormat format = PLCInputFormat::V1) {
    if(blocks.empty()) {
        return std::string();
    }

    std::string output;
    if(format == PLCInputFormat::V1) {
        output = PLC_INPUT_FORMAT_V1_HEADER;
        output.push_back('\n');
    }
    for(std::size_t i = 0; i < blocks.size(); ++i) {
        output += blocks[i].serialize_data();
        output.push_back('\n');
    }
    return output;
}
