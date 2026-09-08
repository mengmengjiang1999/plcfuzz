# PLCFuzz

PLCFuzz 是一个面向 PLC 控制逻辑的学术软件鲁棒性测试原型。它使用 MatIEC 将 IEC 61131-3 Structured Text（ST）程序转换为 C，构建基于 OpenPLC 的离线执行目标，提取 PLC 变量映射，再通过 AFL++ 和结构感知的自动输入生成观察非正常终止、异常状态变化和候选并发问题。

> [!IMPORTANT]
> 本项目只用于经过授权的学术研究与软件质量实验。所有实验都应在隔离的仿真环境或专用实验台中进行，不得连接或控制生产 PLC、现场设备及在役工业系统。本项目不是可部署的 OpenPLC 发行版，也不提供认证、生产运行或运行可靠性结论。

## 研究范围

- 研究对象是测试用 ST 程序、编译器兼容性和仿真运行时行为；
- 研究方法是覆盖率引导的自动输入生成、状态观测和可复现实验；
- 输出仅表示需要进一步人工分析的候选样本，不自动证明存在确定缺陷；
- 使用者必须拥有被测代码与实验环境的明确授权，并遵守所在机构的研究规范。

## 工作流

```text
ST 测试程序
    │
    ▼
MatIEC submodule ────────────────► 语法/语义兼容性测试
    │
    ▼
生成 PLC C 代码（plclogic/）
    │
    ├──► OpenPLC 普通目标（openplc）
    │
    ├──► 变量映射（plc_variables_mapping.csv）
    │         │
    │         ▼
    │    AFL++ 自定义变异器
    │
    └──► AFL++ 插桩目标（openplc_fuzz）
              │
              ▼
        findings/ 与 results/
```

## 当前 MatIEC

项目通过 Git submodule 固定使用 [`mengmengjiang1999/matiec`](https://github.com/mengmengjiang1999/matiec)。当前锁定的提交由 `third_party/matiec` gitlink 决定，克隆仓库时不会随上游 `main` 自动漂移。

新版 MatIEC 提供：

- `iec2c`：校验 IEC 61131-3 文本程序并生成 C；
- `iec2iec`：校验并规范化输出 IEC 文本；
- 默认 `legacy` profile；
- 可选 `iec61131-3:2025-experimental` profile，覆盖 UTF-8 字符串、引用初始化、命名空间、功能块方法和配置级 `VAR_ACCESS` 等实验性能力。

实验 profile 不是完整或经认证的 IEC 61131-3:2025 符合性声明。PLCFuzz 的默认运行时构建继续使用 `legacy` profile；实验 profile 用例用于编译器兼容性验证。

旧实验使用的 MatIEC 二进制已移至 `artifacts/legacy/matiec/`，仅用于复现，不再是当前默认编译器。

## 克隆

```bash
git clone --recurse-submodules https://github.com/mengmengjiang1999/plcfuzz.git
cd plcfuzz
```

如果已经克隆过仓库：

```bash
git submodule update --init --recursive
```

## 环境要求

完整 OpenPLC/AFL++ 流程推荐使用 **x86-64 Ubuntu 22.04**。主要依赖：

- Autoconf 2.69+
- Automake 1.16+
- Bison 2.4+
- Flex 2.6+
- GCC/G++ 与 GNU++11/17 支持
- CMake、GNU Make、pkg-config
- Python 3
- AFL++ 4.10c

macOS 可以构建和测试新版 MatIEC；Apple 自带 Bison 2.3 不满足要求，`scripts/setup_matiec.sh` 会优先使用 Homebrew Bison。完整 PLCFuzz 运行时仍建议放在 Linux 容器中验证。

精确复现信息见 [REPRODUCIBILITY.md](REPRODUCIBILITY.md)，第三方来源和许可状态见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

## 快速开始

### 1. 构建 MatIEC

```bash
./scripts/setup_matiec.sh
```

同时运行 MatIEC 自身测试：

```bash
MATIEC_RUN_TESTS=1 ./scripts/setup_matiec.sh
```

### 2. 验证 ST 测试用例

```bash
./scripts/validate_testcases.sh
```

验证器分别使用 `legacy` 和 `iec61131-3:2025-experimental` profile，将生成结果写入临时目录，不会覆盖 `plclogic/`。

### 3. 构建 PLCFuzz

```bash
./buildscript.sh
```

默认输入是 `testcases/race_test_success.st`，依次执行：

1. ST 转 C；
2. 构建普通运行目标；
3. 生成变量映射；
4. 构建 AFL++ 自定义变异器；
5. 构建 AFL++ 插桩目标。

指定其他输入：

```bash
./buildscript.sh all testcases/matiec/legacy/state_machine.st
```

只执行某一步：

```bash
./buildscript.sh plc testcases/race_test_success.st
./buildscript.sh runtime
./buildscript.sh analyze
./buildscript.sh mutator
./buildscript.sh fuzz
```

## 手动构建

### ST 转 C

```bash
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
```

默认调用 `third_party/matiec/iec2c`，生成 `plclogic/Config0.c`、`Res0.c`、`LOCATED_VARIABLES.h` 等文件。可用环境变量覆盖：

| 变量 | 用途 |
| --- | --- |
| `MATIEC_IEC2C` | 指定其他 `iec2c` 可执行文件 |
| `MATIEC_INCLUDE_DIR` | 指定 MatIEC 标准库/include 目录 |
| `MATIEC_STD` | 选择 MatIEC 语言 profile |
| `PLCLOGIC_DIR` | 覆盖生成代码目录 |

例如，使用历史编译器复现旧结果：

```bash
MATIEC_IEC2C=./artifacts/legacy/matiec/iec2c \
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
```

新版和历史 MatIEC 的生成结果不能默认视为等价；比较自动化测试数据时应记录使用的 MatIEC commit 或二进制 SHA-256。

### 普通目标与变量映射

```bash
./build_scripts/build.sh
python3 ./static_analyse/main.py
```

输出：

- `openplc`：非插桩运行目标；
- `plc_variables_mapping.csv`：自定义变异器使用的 I/O 与内存变量映射。

### 自定义变异器与 fuzz 目标

```bash
./build_scripts/build_shared_library.sh
./build_scripts/buildfuzz.sh
```

输出：

- `build/mutator/libplc_mutator.so`：AFL++ 自定义变异器；
- `openplc_fuzz`：AFL++ 插桩目标；
- `build/runtime/` 与 `build/fuzz/`：互相隔离的对象文件。

## 运行自动化鲁棒性实验

先复制保留的种子：

```bash
mkdir -p seeds
cp -a "seeds copy/." seeds/
```

运行：

```bash
./runfuzz.sh
```

脚本默认启用 `build/mutator/libplc_mutator.so`，并使用仓库内的 `fuzz_config/plc.grammar`。常用配置：

| 变量 | 默认值 | 用途 |
| --- | --- | --- |
| `FUZZ_DURATION` | `3600` | 运行秒数 |
| `FUZZ_TIMEOUT` | `10000` | 单次执行超时（毫秒） |
| `SEED_DIR` | `seeds/` | 种子目录 |
| `FINDINGS_DIR` | `findings/` | 输出目录 |
| `AFL_GRAMMAR` | `fuzz_config/plc.grammar` | grammar 文件 |
| `AFL_CUSTOM_MUTATOR_LIBRARY` | `build/mutator/libplc_mutator.so` | 自定义变异器 |
| `FUZZ_TARGET` | `openplc_fuzz` | 插桩目标 |

建议为新实验指定独立输出目录，避免覆盖历史结果：

```bash
FUZZ_DURATION=60 \
FINDINGS_DIR=output/smoke-test \
./runfuzz.sh
```

重放一个 AFL 输入：

```bash
./run_single_fuzz_example.sh findings/default/queue/<input-file>
```

## 测试

```bash
# MatIEC 自身完整测试
MATIEC_RUN_TESTS=1 ./scripts/setup_matiec.sh

# PLCFuzz 新增的 MatIEC 合法用例
./scripts/validate_testcases.sh

# 学术范围和维护用语检查
./scripts/check_project_wording.sh

# 活动源码、归档与生成快照一致性
./scripts/check_source_layout.sh

# 自定义变异器输入的解析/序列化往返测试
./scripts/test_unit.sh

# 历史二进制和 findings 完整性
./scripts/verify_preserved_artifacts.sh
```

测试用例说明见 [testcases/matiec/README.md](testcases/matiec/README.md)。

## 目录

| 路径 | 内容 |
| --- | --- |
| `third_party/matiec/` | 当前 MatIEC submodule |
| `src/`、`include/`、`lib/` | OpenPLC 运行时及 PLC 输入模拟代码 |
| `build_scripts/` | 构建流水线内部脚本 |
| `scripts/` | 环境准备、验证和单元测试入口 |
| `fuzz_config/` | AFL++ grammar、dictionary 与自定义变异器 |
| `static_analyse/` | PLC 变量映射提取工具 |
| `testcases/` | 活动 ST/LD 样例、MatIEC 兼容性用例和历史归档 |
| `tests/` | PLCFuzz 单元测试 |
| `artifacts/legacy/` | 历史 MatIEC/OpenPLC 二进制与快照 |
| `seeds copy/` | 只读保留的历史种子 |
| `findings/`、`findings copy/` | 历史 AFL++ 队列、异常终止样本和统计数据 |
| `results/` | 批量实验统计结果 |
| `docs/` | 研究笔记、实验记录和改进建议 |
| `lunwenfuxian/petrinet/` | 梯形图到 Petri 网及竞争分析实验 |

## 历史材料

以下内容用于复现，不应作为普通构建缓存删除：

- `artifacts/legacy/matiec/iec2c`、`iec2iec` 和 `tmp.yy`；
- `artifacts/legacy/openplc_fuzz`；
- `tools/glue_generator`；
- `artifacts/legacy/openplc-disabled-source/` 中不参与当前构建的早期模块；
- `artifacts/legacy/fuzz-config/` 中不兼容当前输入格式的早期配置；
- `findings/`、`findings copy/` 与 `results/`。

这些目录中的 AFL++ 原始统计文件保持第三方工具的字段名称不变，以保证实验记录可核验；其中的字段名属于上游数据格式，不代表本项目的用途或结论。

使用以下命令校验保留二进制：

```bash
./scripts/verify_preserved_artifacts.sh
```

## 生成的参考快照

仓库有意跟踪 `src/glueVars.cpp` 与根目录的 `plc_variables_mapping.csv`，二者对应 README 默认 ST 程序的同一份生成结果，使未运行完整工具链的检出也能进行代码审阅和轻量测试。更换参考程序时按以下顺序同时刷新：

```sh
./buildscript.sh plc testcases/race_test_success.st
./buildscript.sh runtime
./buildscript.sh analyze
./scripts/check_source_layout.sh
```

`runtime` 步骤根据 `plclogic/LOCATED_VARIABLES.h` 刷新 glue 文件，`analyze` 随后从该文件重建唯一的活动变量映射。两份文件应在同一个提交中更新。

## 当前限制

- 竞争问题的判定目前基于最近输出变化，是实验性启发式，不等价于严格的数据竞争检测。
- 13 个不满足新版 MatIEC 要求的历史 ST 文件已移至 `testcases/archive/incompatible-matiec/`，程序逻辑保持不变且不纳入活动语料。
- 默认自动化测试输入格式是固定顺序的文本数值块，grammar、解析器和变异器需要同步演进。
- 当前没有远端 CI；完整 OpenPLC/AFL++ 链仍需在 Linux 环境验证。
- 仓库已提供顶层 GPLv3 `LICENSE`；收集的第三方测试语料和实验数据仍需逐项核对来源与再分发权。

更完整的技术债与优先级见 [docs/IMPROVEMENTS.md](docs/IMPROVEMENTS.md)。

## 相关文档

- [可复现环境](REPRODUCIBILITY.md)
- [第三方代码与许可说明](THIRD_PARTY_NOTICES.md)
- [改进建议](docs/IMPROVEMENTS.md)
- [变更记录](docs/CHANGELOG.md)
- [构建脚本历史说明](build_scripts/README.md)
- [Petri 网实验说明](lunwenfuxian/petrinet/README.md)
