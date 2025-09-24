
#include <stdint.h>

#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <random>
#include <sstream>
#include <string>
#include <vector>

#include "mutator_helper.h"
#include "plc_input_block.h"

// 最小化的AFL++头文件接口
extern "C" {
typedef struct afl_state afl_state_t;

// 必须导出的函数

void *afl_custom_init(afl_state_t *afl, unsigned int seed);
size_t afl_custom_fuzz(void *data, uint8_t *buf, size_t buf_size, uint8_t **out_buf, uint8_t *add_buf, size_t add_buf_size,
                       size_t max_size);
void afl_custom_deinit(void *data);
}

// 变量映射结构体
struct VariableMapping {
    std::string var_type;
    int array_index;
    int bit_index;  // 仅布尔类型使用
    std::string var_name;
};

// 全局变量映射表
std::vector<VariableMapping> plc_variable_mappings;

// 加载PLC变量映射表
void load_plc_variable_mappings(const char *csv_file) {
    std::ifstream file(csv_file);
    if (!file.is_open())
        return;

    std::string line;
    // 跳过标题行
    std::getline(file, line);

    while (std::getline(file, line)) {
        std::stringstream ss(line);
        VariableMapping mapping;

        std::getline(ss, mapping.var_type, ',');
        std::string temp;

        std::getline(ss, temp, ',');
        mapping.array_index = std::stoi(temp);

        std::getline(ss, temp, ',');
        mapping.bit_index = temp.empty() ? -1 : std::stoi(temp);

        std::getline(ss, mapping.var_name, ',');

        plc_variable_mappings.push_back(mapping);
    }
}

// 变异器状态
class MutatorState {
   private:
    afl_state_t *afl;
    unsigned int seed;
    std::mt19937 rng;
    std::vector<PLCInputBlock> seed_cache;
    int mutation_rate_ = 50;

   public:
    MutatorState(afl_state_t *afl_ptr, unsigned int s) : afl(afl_ptr), seed(s), rng(s) {
        load_plc_variable_mappings("plc_variables_mapping.csv");
    }

    int mutation_rate() { return mutation_rate_; }

    // 获取随机数生成器
    std::mt19937 &get_rng() { return rng; }

    // 添加种子到缓存
    void add_to_cache(const PLCInputBlock &block) { seed_cache.push_back(block); }

    // 从缓存获取随机块
    const PLCInputBlock *get_random_block() {
        if (seed_cache.empty())
            return nullptr;
        std::uniform_int_distribution<size_t> dist(0, seed_cache.size() - 1);
        return &seed_cache[dist(rng)];
    }

    // 检查是否需要变异该变量
    bool should_mutate(const std::string &var_type, int array_idx, int bit_idx = -1) {
        for (const auto &mapping : plc_variable_mappings) {
            if (mapping.var_type == var_type && mapping.array_index == array_idx &&
                (bit_idx == -1 || mapping.bit_index == bit_idx)) {
                return true;
            }
        }
        return false;
    }
};

// 初始化函数
extern "C" void *afl_custom_init(afl_state_t *afl, unsigned int seed) { return new MutatorState(afl, seed); }

// 公共变异策略 - cycles
void mutate_cycles(PLCInputBlock &block, MutatorState *state) {
    int cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
    // 随机增减cycles值
    if (random() % 100 < state->mutation_rate()) {
        // 布尔块
        block.input_bool_block.cycles += cycle_delta;
        if (block.input_bool_block.cycles < 0)
            block.input_bool_block.cycles = 0;

        // 字节块
        cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
        block.input_byte_block.cycles += cycle_delta;
        if (block.input_byte_block.cycles < 0)
            block.input_byte_block.cycles = 0;

        // 整型块
        cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
        block.input_int_block.cycles += cycle_delta;
        if (block.input_int_block.cycles < 0)
            block.input_int_block.cycles = 0;

        // 双整型块
        cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
        block.input_dint_block.cycles += cycle_delta;
        if (block.input_dint_block.cycles < 0)
            block.input_dint_block.cycles = 0;

        // 长整型块
        cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
        block.input_lint_block.cycles += cycle_delta;
        if (block.input_lint_block.cycles < 0)
            block.input_lint_block.cycles = 0;

        // 整型内存块
        cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
        block.input_int_mem_block.cycles += cycle_delta;
        if (block.input_int_mem_block.cycles < 0)
            block.input_int_mem_block.cycles = 0;

        // 双整型内存块
        cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
        block.input_dint_mem_block.cycles += cycle_delta;
        if (block.input_dint_mem_block.cycles < 0)
            block.input_dint_mem_block.cycles = 0;
    }
}

// BoolBlock专用变异策略（2D数组）
void mutate_bool_block(BasicInputBlock<unsigned char, 2> &block, MutatorState *state) {
    // for (int i = 0; i < BUFFER_SIZE; ++i) {
    //     for (int j = 0; j < 8; ++j) {
    //         if (state->should_mutate("bool_inputs", i, j)) {
    //             if (random() % 100 < state->mutation_rate()) {
    //                 block.input[i][j] = !block.input[i][j];
    //             }
    //         }
    //     }
    // }
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "byte_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                // 更激进的变异策略
                switch (random() % 3) {
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
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "byte_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                // 针对字节变量的强化变异
                // block.input[mapping.array_index] = (random() % 2) ? 0xFF : 0x00;  // 50%概率全1或全0
                //         // 字节级变异：位翻转、增减小量、随机值
                switch (random() % 3) {
                    case 0:
                        block.input[mapping.array_index] ^= (1 << (random() % 8));
                        break;  // 位翻转
                    case 1:
                        block.input[mapping.array_index] += (random() % 5) - 2;
                        break;  // 小量增减
                    case 2:
                        block.input[mapping.array_index] = random() & 0xFF;
                        break;  // 随机值
                }
            }
        }
    }
}

// IntBlock专用变异策略
void mutate_int_block(BasicInputBlock<IEC_INT, 1> &block, MutatorState *state) {
    // for (int i = 0; i < BUFFER_SIZE; ++i) {
    //     if (state->should_mutate("int_inputs", i) && random() % 100 < state->mutation_rate()) {
    //         // 针对整数的更复杂变异
    //         switch (random() % 4) {
    //             case 0:
    //                 block.input[i] ^= (1 << (random() % 16));
    //                 break;  // 位翻转
    //             case 1:
    //                 block.input[i] += (random() % 100) - 50;
    //                 break;  // 中等范围增减
    //             case 2:
    //                 block.input[i] = random() & 0xFFFF;
    //                 break;  // 随机值
    //             case 3:
    //                 block.input[i] = -block.input[i];
    //                 break;  // 取负
    //         }
    //     }
    // }
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "byte_inputs") {
            switch (random() % 4) {
                case 0:
                    block.input[mapping.array_index] ^= (1 << (random() % 16));
                    break;  // 位翻转
                case 1:
                    block.input[mapping.array_index] += (random() % 100) - 50;
                    break;  // 中等范围增减
                case 2:
                    block.input[mapping.array_index] = random() & 0xFFFF;
                    break;  // 随机值
                case 3:
                    block.input[mapping.array_index] = -block.input[mapping.array_index];
                    break;  // 取负
            }
        }
    }
}

// DIntBlock专用变异策略（32位）
void mutate_dint_block(BasicInputBlock<IEC_DINT, 1> &block, MutatorState *state) {
    // for (int i = 0; i < BUFFER_SIZE; ++i) {
    // if (state->should_mutate("dint_inputs", i) && random() % 100 < state->mutation_rate()) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "dint_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                // 针对双整型的更复杂变异
                switch (random() % 5) {
                    case 0:
                        block.input[mapping.array_index] ^= (1 << (random() % 32));
                        break;
                    case 1:
                        block.input[mapping.array_index] += (random() % 1000) - 500;
                        break;
                    case 2:
                        block.input[mapping.array_index] = random();
                        break;
                    case 3:
                        block.input[mapping.array_index] = -block.input[mapping.array_index];
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
void mutate_lint_block(BasicInputBlock<IEC_LINT, 1> &block, MutatorState *state) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "lint_inputs") {
            // for (int i = 0; i < BUFFER_SIZE; ++i) {
            //     if (state->should_mutate("lint_inputs", i) && random() % 100 < state->mutation_rate()) {
            if (random() % 100 < state->mutation_rate()) {
                switch (random() % 6) {
                    case 0:
                        block.input[mapping.array_index] ^= (1LL << (random() % 64));
                        break;
                    case 1:
                        block.input[mapping.array_index] += (random() % 10000) - 5000;
                        break;
                    case 2:
                        block.input[mapping.array_index] = random();
                        break;
                    case 3:
                        block.input[mapping.array_index] = -block.input[mapping.array_index];
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
    // 可以添加内存特定变异，如边界值测试
    // for (int i = 0; i < BUFFER_SIZE; ++i) {
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "int_mem_inputs") {
            if (random() % 100 < state->mutation_rate()) {
                // if (state->should_mutate("int_mem_inputs", i) && random() % 100 < state->mutation_rate()) {
                switch (random() % 4) {
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
    for (const auto &mapping : plc_variable_mappings) {
        if (mapping.var_type == "dint_mem_inputs") {
            // for (int i = 0; i < BUFFER_SIZE; ++i) {
            //     if (state->should_mutate("dint_mem_inputs", i) && random() % 100 < state->mutation_rate()) {
            if (random() % 100 < state->mutation_rate()) {
                switch (random() % 5) {
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
    }

    // 3. 序列化输出
    size_t new_size = 0;
    *out_buf = serialize_plc_data(blocks, &new_size);

    return new_size;
}

// 清理函数
extern "C" void afl_custom_deinit(void *data) { delete static_cast<MutatorState *>(data); }