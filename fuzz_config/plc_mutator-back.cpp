
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
    afl_state_t *afl;
    unsigned int seed;
    std::mt19937 rng;
    std::vector<PLCInputBlock> seed_cache;

    int mutation_rate_ = 50;

   public:
    MutatorState(afl_state_t *afl_ptr, unsigned int s) : afl(afl_ptr), seed(s), rng(s) {}

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
};

// 初始化函数
extern "C" void *afl_custom_init(afl_state_t *afl, unsigned int seed) { return new MutatorState(afl, seed); }

// 公共变异策略 - cycles
void mutate_cycles(PLCInputBlock &block, MutatorState *state) {
    // 使用相同的随机变化量保证所有cycles同步变化
    int cycle_delta = (random() % 5) - 2;  // -2到+2的随机变化
    // 随机增减cycles值
    if (random() % 100 < state->mutation_rate()) {
        // 布尔块
        block.input_bool_block.cycles += cycle_delta;
        if (block.input_bool_block.cycles < 0)
            block.input_bool_block.cycles = 0;

        // 字节块
        block.input_byte_block.cycles += cycle_delta;
        if (block.input_byte_block.cycles < 0)
            block.input_byte_block.cycles = 0;

        // 整型块
        block.input_int_block.cycles += cycle_delta;
        if (block.input_int_block.cycles < 0)
            block.input_int_block.cycles = 0;

        // 双整型块
        block.input_dint_block.cycles += cycle_delta;
        if (block.input_dint_block.cycles < 0)
            block.input_dint_block.cycles = 0;

        // 长整型块
        block.input_lint_block.cycles += cycle_delta;
        if (block.input_lint_block.cycles < 0)
            block.input_lint_block.cycles = 0;

        // 整型内存块
        block.input_int_mem_block.cycles += cycle_delta;
        if (block.input_int_mem_block.cycles < 0)
            block.input_int_mem_block.cycles = 0;

        // 双整型内存块
        block.input_dint_mem_block.cycles += cycle_delta;
        if (block.input_dint_mem_block.cycles < 0)
            block.input_dint_mem_block.cycles = 0;
    }
}

// BoolBlock专用变异策略（2D数组）
void mutate_bool_block(BasicInputBlock<unsigned char, 2> &block, MutatorState *state) {
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        for (int j = 0; j < 8; ++j) {
            if (random() % 100 < state->mutation_rate()) {
                // 布尔值直接取反
                block.input[i][j] = !block.input[i][j];
            }
        }
    }
}

// ByteBlock专用变异策略
void mutate_byte_block(BasicInputBlock<IEC_BYTE, 1> &block, MutatorState *state) {
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        if (random() % 100 < state->mutation_rate()) {
            // 字节级变异：位翻转、增减小量、随机值
            switch (random() % 3) {
                case 0:
                    block.input[i] ^= (1 << (random() % 8));
                    break;  // 位翻转
                case 1:
                    block.input[i] += (random() % 5) - 2;
                    break;  // 小量增减
                case 2:
                    block.input[i] = random() & 0xFF;
                    break;  // 随机值
            }
        }
    }
}

// IntBlock专用变异策略
void mutate_int_block(BasicInputBlock<IEC_INT, 1> &block, MutatorState *state) {
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        if (random() % 100 < state->mutation_rate()) {
            // 针对整数的更复杂变异
            switch (random() % 4) {
                case 0:
                    block.input[i] ^= (1 << (random() % 16));
                    break;  // 位翻转
                case 1:
                    block.input[i] += (random() % 100) - 50;
                    break;  // 中等范围增减
                case 2:
                    block.input[i] = random() & 0xFFFF;
                    break;  // 随机值
                case 3:
                    block.input[i] = -block.input[i];
                    break;  // 取负
            }
        }
    }
}

// DIntBlock专用变异策略（32位）
void mutate_dint_block(BasicInputBlock<IEC_DINT, 1> &block, MutatorState *state) {
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        if (random() % 100 < state->mutation_rate()) {
            switch (random() % 5) {
                case 0:
                    block.input[i] ^= (1 << (random() % 32));
                    break;
                case 1:
                    block.input[i] += (random() % 1000) - 500;
                    break;
                case 2:
                    block.input[i] = random();
                    break;
                case 3:
                    block.input[i] = -block.input[i];
                    break;
                case 4:
                    reverse_bytes(block.input[i]);
                    break;  // 字节序翻转
            }
        }
    }
}

// LIntBlock专用变异策略（64位）
void mutate_lint_block(BasicInputBlock<IEC_LINT, 1> &block, MutatorState *state) {
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        if (random() % 100 < state->mutation_rate()) {
            switch (random() % 6) {
                case 0:
                    block.input[i] ^= (1LL << (random() % 64));
                    break;
                case 1:
                    block.input[i] += (random() % 10000) - 5000;
                    break;
                case 2:
                    block.input[i] = random();
                    break;
                case 3:
                    block.input[i] = -block.input[i];
                    break;
                case 4:
                    reverse_bytes(block.input[i]);
                    break;
                case 5:
                    block.input[i] = ~block.input[i];
                    break;  // 按位取反
            }
        }
    }
}

// 内存块专用变异策略（根据实际情况调整）
void mutate_int_mem_block(BasicInputBlock<IEC_UINT, 1> &block, MutatorState *state) {
    // 可以添加内存特定变异，如边界值测试
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        if (random() % 100 < state->mutation_rate()) {
            switch (random() % 4) {
                case 0:
                    block.input[i] = 0;
                    break;
                case 1:
                    block.input[i] = 0xFFFF;
                    break;
                case 2:
                    block.input[i] = block.input[i] + 1;
                    break;
                case 3:
                    block.input[i] = block.input[i] - 1;
                    break;
            }
        }
    }
}

void mutate_dint_mem_block(BasicInputBlock<IEC_UDINT, 1> &block, MutatorState *state) {
    // 类似int_mem_block但针对32位
    for (int i = 0; i < BUFFER_SIZE; ++i) {
        if (random() % 100 < state->mutation_rate()) {
            switch (random() % 5) {
                case 0:
                    block.input[i] = 0;
                    break;
                case 1:
                    block.input[i] = 0xFFFFFFFF;
                    break;
                case 2:
                    block.input[i] = block.input[i] + 1;
                    break;
                case 3:
                    block.input[i] = block.input[i] - 1;
                    break;
                case 4:
                    reverse_bytes(block.input[i]);
                    break;
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