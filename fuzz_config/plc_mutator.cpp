
#include <stdint.h>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <stdexcept>
#include <string>
#include <vector>

#include "mutator_helper.h"
#include "plc_input_block.h"
#include "variable_mapping.h"

// 最小化的AFL++头文件接口
extern "C" {
typedef struct afl_state afl_state_t;

// 必须导出的函数

void *afl_custom_init(afl_state_t *afl, unsigned int seed);
size_t afl_custom_fuzz(void *data, uint8_t *buf, size_t buf_size, uint8_t **out_buf, uint8_t *add_buf, size_t add_buf_size,
                       size_t max_size);
void afl_custom_deinit(void *data);
}

// 变异器状态
class MutatorState {
   private:
    std::mt19937 rng;
    std::vector<VariableMapping> mappings_;
    std::vector<uint8_t> output_buffer;
    int mutation_rate_ = 50;

   public:
    MutatorState(afl_state_t *, unsigned int seed) : rng(seed) {
        const char *configured_path = std::getenv("PLCFUZZ_VARIABLE_MAPPING");
        const std::string mapping_path = configured_path == NULL ? "plc_variables_mapping.csv" : configured_path;
        mappings_ = load_variable_mappings(mapping_path);
    }

    std::uint32_t random_value() { return rng(); }

    std::uint64_t random_wide_value() {
        const std::uint64_t high = random_value();
        const std::uint64_t low = random_value();
        return (high << 32) | low;
    }

    std::uint32_t random_below(std::uint32_t upper_bound) { return random_value() % upper_bound; }

    bool mutation_selected() { return random_below(100) < static_cast<std::uint32_t>(mutation_rate_); }

    const std::vector<VariableMapping> &mappings() const { return mappings_; }

    uint8_t *set_output(const std::string &output) {
        output_buffer.assign(output.begin(), output.end());
        return output_buffer.data();
    }
};

// 初始化函数
extern "C" void *afl_custom_init(afl_state_t *afl, unsigned int seed) {
    try {
        return new MutatorState(afl, seed);
    } catch(const std::exception &error) {
        std::fprintf(stderr, "PLCFuzz custom mutator initialization failed: %s\n", error.what());
        return nullptr;
    }
}

// 公共变异策略 - cycles
void mutate_cycles(PLCInputBlock &block, MutatorState *state) {
    // 随机增减cycles值
    if (state->mutation_selected()) {
        // 布尔块
        block.input_bool_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_bool_block.cycles < 0)
            block.input_bool_block.cycles = 0;

        // 字节块
        block.input_byte_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_byte_block.cycles < 0)
            block.input_byte_block.cycles = 0;

        // 整型块
        block.input_int_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_int_block.cycles < 0)
            block.input_int_block.cycles = 0;

        // 双整型块
        block.input_dint_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_dint_block.cycles < 0)
            block.input_dint_block.cycles = 0;

        // 长整型块
        block.input_lint_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_lint_block.cycles < 0)
            block.input_lint_block.cycles = 0;

        // 整型内存块
        block.input_int_mem_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_int_mem_block.cycles < 0)
            block.input_int_mem_block.cycles = 0;

        // 双整型内存块
        block.input_dint_mem_block.cycles += static_cast<int>(state->random_below(5)) - 2;
        if (block.input_dint_mem_block.cycles < 0)
            block.input_dint_mem_block.cycles = 0;
    }
}

// BoolBlock专用变异策略（2D数组）
void mutate_bool_block(BasicInputBlock<unsigned char, 2> &block, MutatorState *state) {
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "bool_inputs" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE &&
            mapping.bit_index >= 0 && mapping.bit_index < 8) {
            if (state->mutation_selected()) {
                // 更激进的变异策略
                switch (state->random_below(3)) {
                    case 0:
                        block.input[mapping.array_index][mapping.bit_index] ^= 1;  // 位翻转
                        break;
                    case 1:
                        block.input[mapping.array_index][mapping.bit_index] = 1;  // 强制置1
                        break;
                    case 2:
                        block.input[mapping.array_index][mapping.bit_index] = 0;  // 强制置0
                        break;
                }
            }
        }
    }
}

// ByteBlock专用变异策略
void mutate_byte_block(BasicInputBlock<IEC_BYTE, 1> &block, MutatorState *state) {
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "byte_inputs" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE) {
            if (state->mutation_selected()) {
                // 字节级变异：位翻转、增减小量、随机值
                switch (state->random_below(3)) {
                    case 0:
                        block.input[mapping.array_index] ^= unsigned_bit_mask<IEC_BYTE>(state->random_below(8));
                        break;  // 位翻转
                    case 1:
                        block.input[mapping.array_index] = static_cast<IEC_BYTE>(
                            block.input[mapping.array_index] + static_cast<int>(state->random_below(5)) - 2);
                        break;  // 小量增减
                    case 2:
                        block.input[mapping.array_index] = static_cast<IEC_BYTE>(state->random_value());
                        break;  // 随机值
                }
            }
        }
    }
}

// IntBlock专用变异策略
void mutate_int_block(BasicInputBlock<IEC_UINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "int_inputs" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE) {
            if (!state->mutation_selected()) {
                continue;
            }
            switch (state->random_below(4)) {
                case 0:
                    block.input[mapping.array_index] ^= unsigned_bit_mask<IEC_UINT>(state->random_below(16));
                    break;  // 位翻转
                case 1:
                    block.input[mapping.array_index] = static_cast<IEC_UINT>(
                        block.input[mapping.array_index] + static_cast<int>(state->random_below(100)) - 50);
                    break;  // 中等范围增减
                case 2:
                    block.input[mapping.array_index] = static_cast<IEC_UINT>(state->random_value());
                    break;  // 随机值
                case 3:
                    block.input[mapping.array_index] = IEC_UINT(0) - block.input[mapping.array_index];
                    break;  // 取负
            }
        }
    }
}

// DIntBlock专用变异策略（32位）
void mutate_dint_block(BasicInputBlock<IEC_UDINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "dint_inputs" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE) {
            if (state->mutation_selected()) {
                // 针对双整型的更复杂变异
                switch (state->random_below(5)) {
                    case 0:
                        block.input[mapping.array_index] ^= unsigned_bit_mask<IEC_UDINT>(state->random_below(32));
                        break;
                    case 1:
                        block.input[mapping.array_index] +=
                            static_cast<IEC_UDINT>(static_cast<int>(state->random_below(1000)) - 500);
                        break;
                    case 2:
                        block.input[mapping.array_index] = static_cast<IEC_UDINT>(state->random_value());
                        break;
                    case 3:
                        block.input[mapping.array_index] = IEC_UDINT(0) - block.input[mapping.array_index];
                        break;
                    case 4:
                        reverse_bytes(block.input[mapping.array_index]);
                        break;  // 字节序翻转
                }
            }
        }
    }
}
// LIntBlock专用变异策略（64位）
void mutate_lint_block(BasicInputBlock<IEC_ULINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "lint_inputs" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE) {
            if (state->mutation_selected()) {
                switch (state->random_below(6)) {
                    case 0:
                        block.input[mapping.array_index] ^= unsigned_bit_mask<IEC_ULINT>(state->random_below(64));
                        break;
                    case 1:
                        block.input[mapping.array_index] +=
                            static_cast<IEC_ULINT>(static_cast<int>(state->random_below(10000)) - 5000);
                        break;
                    case 2:
                        block.input[mapping.array_index] = static_cast<IEC_ULINT>(state->random_wide_value());
                        break;
                    case 3:
                        block.input[mapping.array_index] = IEC_ULINT(0) - block.input[mapping.array_index];
                        break;
                    case 4:
                        reverse_bytes(block.input[mapping.array_index]);
                        break;
                    case 5:
                        block.input[mapping.array_index] = ~block.input[mapping.array_index];
                        break;  // 按位取反
                }
            }
        }
    }
}

// 内存块专用变异策略（根据实际情况调整）
void mutate_int_mem_block(BasicInputBlock<IEC_UINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "int_memory" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE) {
            if (state->mutation_selected()) {
                switch (state->random_below(4)) {
                    case 0:
                        block.input[mapping.array_index] = 0;
                        break;
                    case 1:
                        block.input[mapping.array_index] = 0xFFFF;
                        break;
                    case 2:
                        block.input[mapping.array_index] = block.input[mapping.array_index] + 1;
                        break;
                    case 3:
                        block.input[mapping.array_index] = block.input[mapping.array_index] - 1;
                        break;
                }
            }
        }
    }
}

void mutate_dint_mem_block(BasicInputBlock<IEC_UDINT, 1> &block, MutatorState *state) {
    // 类似int_mem_block但针对32位
    for (const auto &mapping : state->mappings()) {
        if (mapping.var_type == "dint_memory" && mapping.array_index >= 0 && mapping.array_index < PLC_INPUT_SIZE) {
            if (state->mutation_selected()) {
                switch (state->random_below(5)) {
                    case 0:
                        block.input[mapping.array_index] = 0;
                        break;
                    case 1:
                        block.input[mapping.array_index] = 0xFFFFFFFF;
                        break;
                    case 2:
                        block.input[mapping.array_index] = block.input[mapping.array_index] + 1;
                        break;
                    case 3:
                        block.input[mapping.array_index] = block.input[mapping.array_index] - 1;
                        break;
                    case 4:
                        reverse_bytes(block.input[mapping.array_index]);
                        break;
                }
            }
        }
    }
}

// 主变异函数
extern "C" size_t afl_custom_fuzz(void *data, uint8_t *buf, size_t buf_size, uint8_t **out_buf, uint8_t *add_buf,
                                  size_t add_buf_size, size_t max_size) {
    (void)add_buf;
    (void)add_buf_size;
    if(out_buf == nullptr) {
        return 0;
    }
    *out_buf = nullptr;
    if(data == nullptr) {
        return 0;
    }
    MutatorState *state = static_cast<MutatorState *>(data);
    std::vector<PLCInputBlock> blocks;

    // 1. 解析输入数据
    if (!parse_plc_data(buf, buf_size, blocks)) {
        *out_buf = nullptr;
        return 0;
    }

    // 2. 执行变异
    for (auto &block : blocks) {
        mutate_cycles(block, state);
        mutate_bool_block(block.input_bool_block, state);
        mutate_byte_block(block.input_byte_block, state);
        mutate_int_block(block.input_int_block, state);
        mutate_dint_block(block.input_dint_block, state);
        mutate_lint_block(block.input_lint_block, state);
        mutate_int_mem_block(block.input_int_mem_block, state);
        mutate_dint_mem_block(block.input_dint_mem_block, state);
    }

    // 3. 序列化输出
    const std::string output = serialize_plc_data(blocks);
    if (output.size() > max_size) {
        *out_buf = nullptr;
        return 0;
    }

    *out_buf = state->set_output(output);
    return output.size();
}

// 清理函数
extern "C" void afl_custom_deinit(void *data) { delete static_cast<MutatorState *>(data); }
