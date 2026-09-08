#pragma once

#include <stdint.h>

#include <algorithm>
#include <cstddef>
#include <sstream>
#include <string>
#include <type_traits>
#include <vector>

#include "plc_input_block.h"

template <typename T>
void reverse_bytes(T &value) {
    static_assert(std::is_trivially_copyable<T>::value, "Type must be trivially copyable");
    uint8_t *bytes = reinterpret_cast<uint8_t *>(&value);
    for (size_t i = 0; i < sizeof(T) / 2; ++i) {
        std::swap(bytes[i], bytes[sizeof(T) - 1 - i]);
    }
}

inline bool parse_plc_data(const uint8_t *data, size_t size, std::vector<PLCInputBlock> &blocks) {
    blocks.clear();
    if (data == nullptr || size == 0) {
        return false;
    }

    const std::string input(reinterpret_cast<const char *>(data), size);
    std::istringstream stream(input);

    while (true) {
        stream >> std::ws;
        if (stream.eof()) {
            break;
        }

        PLCInputBlock block;
        if (!(stream >> block)) {
            blocks.clear();
            return false;
        }
        blocks.push_back(block);
    }

    return !blocks.empty();
}

inline std::string serialize_plc_data(const std::vector<PLCInputBlock> &blocks) {
    std::string output;
    for (size_t i = 0; i < blocks.size(); ++i) {
        if (i != 0) {
            output.push_back('\n');
        }
        output += blocks[i].serialize_data();
    }
    output.push_back('\n');
    return output;
}
