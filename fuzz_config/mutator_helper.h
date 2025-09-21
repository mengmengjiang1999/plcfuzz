#pragma once

#include <stdint.h>

#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <random>
#include <string>
#include <vector>

#include "mutator_helper.h"
#include "plc_input_block.h"

template <typename T>
void reverse_bytes(T &value) {
    static_assert(std::is_trivially_copyable_v<T>, "Type must be trivially copyable");
    uint8_t *bytes = reinterpret_cast<uint8_t *>(&value);
    for (size_t i = 0; i < sizeof(T) / 2; i++) {
        std::swap(bytes[i], bytes[sizeof(T) - 1 - i]);
    }
}

// 辅助模板函数，用于解析BasicInputBlock
template <typename T, int Dim>
void parse_basic_block(const uint8_t *data, BasicInputBlock<T, Dim> &block) {
    // 1. 解析cycles
    block.cycles = *reinterpret_cast<const int *>(data);
    data += sizeof(int);

    // 2. 解析input数组
    if constexpr (Dim == 1) {
        for (size_t i = 0; i < BUFFER_SIZE; ++i) {
            block.input[i] = *reinterpret_cast<const T *>(data);
            data += sizeof(T);
        }
    } else if constexpr (Dim == 2) {
        for (size_t i = 0; i < BUFFER_SIZE; ++i) {
            for (size_t j = 0; j < 8; ++j) {
                block.input[i][j] = *reinterpret_cast<const T *>(data);
                data += sizeof(T);
            }
        }
    }
}

// 解析PLC数据
// data: 原始数据
// size：原始数据的大小
// blocks：解析后的数据放在哪里
bool parse_plc_data(const uint8_t *data, size_t size, std::vector<PLCInputBlock> &blocks) {
    // 1. 检查输入参数有效性
    if (data == nullptr || size == 0) {
        return false;

        // 2. 清空输出向量
        blocks.clear();

        // 3. 创建指针用于遍历数据
        const uint8_t *current_pos = data;
        size_t remaining_size = size;

        // 4. 循环解析直到数据耗尽
        while (remaining_size > 0) {
            PLCInputBlock new_block;

            // 5. 解析BoolBlock (2D数组)
            if (remaining_size < new_block.input_bool_block.size())
                break;
            parse_basic_block<unsigned char, 2>(current_pos, new_block.input_bool_block);
            current_pos += new_block.input_bool_block.size();
            remaining_size -= new_block.input_bool_block.size();

            // 6. 解析ByteBlock
            if (remaining_size < new_block.input_byte_block.size())
                break;
            parse_basic_block<IEC_BYTE, 1>(current_pos, new_block.input_byte_block);
            current_pos += new_block.input_byte_block.size();
            remaining_size -= new_block.input_byte_block.size();

            // 7. 解析IntBlock
            if (remaining_size < new_block.input_int_block.size())
                break;
            parse_basic_block<IEC_UINT, 1>(current_pos, new_block.input_int_block);
            current_pos += new_block.input_int_block.size();
            remaining_size -= new_block.input_int_block.size();

            // 8. 解析DIntBlock
            if (remaining_size < new_block.input_dint_block.size())
                break;
            parse_basic_block<IEC_UDINT, 1>(current_pos, new_block.input_dint_block);
            current_pos += new_block.input_dint_block.size();
            remaining_size -= new_block.input_dint_block.size();

            // 9. 解析LIntBlock
            if (remaining_size < new_block.input_lint_block.size())
                break;
            parse_basic_block<IEC_ULINT, 1>(current_pos, new_block.input_lint_block);
            current_pos += new_block.input_lint_block.size();
            remaining_size -= new_block.input_lint_block.size();

            // 10. 解析IntMemoryBlock
            if (remaining_size < new_block.input_int_mem_block.size())
                break;
            parse_basic_block<IEC_UINT, 1>(current_pos, new_block.input_int_mem_block);
            current_pos += new_block.input_int_mem_block.size();
            remaining_size -= new_block.input_int_mem_block.size();

            // 11. 解析DIntMemoryBlock
            if (remaining_size < new_block.input_dint_mem_block.size())
                break;
            parse_basic_block<IEC_UDINT, 1>(current_pos, new_block.input_dint_mem_block);
            current_pos += new_block.input_dint_mem_block.size();
            remaining_size -= new_block.input_dint_mem_block.size();

            // 12. 将完整解析的块添加到结果中
            blocks.push_back(new_block);
        }

        // 13. 检查是否完整解析了至少一个块
        return !blocks.empty();
    }
    return false;
}

// 序列化PLC数据
// out_size是一个需要更新外部变量
// 返回一个指针指向一个内存
uint8_t *serialize_plc_data(std::vector<PLCInputBlock> &blocks, size_t *out_size) {
    std::string buffer;

    for (const auto &block : blocks) {
        buffer += block.serialize_data();
    }
    *out_size = buffer.size();
    uint8_t *result = new uint8_t[*out_size];
    memcpy(result, buffer.data(), *out_size);
    return result;
}
