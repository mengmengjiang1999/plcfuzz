# PLC Robustness Lab

PLC Robustness Lab 是一个面向 PLC 控制逻辑的学术软件鲁棒性测试原型。它使用 MatIEC 将 IEC 61131-3 Structured Text（ST）程序转换为 C，构建基于 OpenPLC 的离线执行目标，提取 PLC 变量映射，再通过 AFL++ 和结构感知的自动输入生成观察非正常终止、异常状态变化和候选并发问题。

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
    │    AFL++ 输入转换器
    │
    └──► AFL++ 插桩目标（openplc_instrumented）
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

实验 profile 不是完整或经认证的 IEC 61131-3:2025 符合性声明。PLC Robustness Lab 的默认运行时构建继续使用 `legacy` profile；实验 profile 用例用于编译器兼容性验证。

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
- AFL++ 5.03c

macOS 可以构建和测试新版 MatIEC；Apple 自带 Bison 2.3 不满足要求，统一入口调用的 MatIEC 设置脚本会优先使用 Homebrew Bison。完整 PLC Robustness Lab 运行时仍建议放在 Linux 容器中验证。

当前运行时保持离线边界：MatIEC 标准库声明的 TCP 辅助函数仅提供链接兼容定义，调用时统一返回“不支持”，不会建立连接或交换数据。

运行时保留 MatIEC 生成代码使用的全局指针数组接口，但后备值由一个固定生命周期对象统一持有；初始化只补全空槽，不覆盖已生成的变量映射。输入槽位和位偏移在应用边界进行范围校验，输入写入与历史采样会先核对整组映射，避免产生部分状态；缓冲区互斥锁由作用域对象自动释放。

精确复现信息见 [REPRODUCIBILITY.md](REPRODUCIBILITY.md)，第三方来源和许可状态见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

在装有 Docker 的主机上，可用一个命令执行固定 `linux/amd64` 环境的完整验收。该命令构建镜像、运行 MatIEC 与项目测试、构建普通/插桩/诊断目标、核对代表性输入回放，并在 `output/linux-container-acceptance/manifest.json` 写入工具版本和镜像内容摘要：

```bash
./scripts/build_linux_container.sh
```

最近一次验收结果及复核方法见 [Linux 容器验收记录](docs/LINUX_CONTAINER_ACCEPTANCE.md)。

ASan/UBSan 构建及非正常终止样本的本地整理流程见 [运行诊断说明](docs/RUNTIME_DIAGNOSTICS.md)。

## 快速开始

所有受维护的构建、运行和测试流程都从 `./scripts/plc-lab` 进入；运行 `./scripts/plc-lab --help` 可查看完整子命令。根目录旧脚本只用于兼容现有调用，会打印迁移提示。

### 1. 构建 MatIEC

```bash
./scripts/plc-lab setup
```

同时运行 MatIEC 自身测试：

```bash
MATIEC_RUN_TESTS=1 ./scripts/plc-lab setup
```

MatIEC 默认使用单作业构建，以避开其递归 Makefile 的共享目标顺序问题。需要自行评估并行构建时可设置 `MATIEC_BUILD_JOBS`；它与项目其他步骤使用的 `BUILD_JOBS` 相互独立。

固定版本 AFL++ 的外层源码构建也使用单作业，避免其主构建与 LLVM 子构建同时写入编译包装器；项目自身的独立构建步骤仍可并行。

### 2. 验证 ST 测试用例

```bash
./scripts/plc-lab test testcases
```

验证器分别使用 `legacy` 和 `iec61131-3:2025-experimental` profile，将生成结果写入临时目录，不会覆盖 `plclogic/`。

### 3. 构建实验目标

```bash
./scripts/plc-lab build
```

默认输入是 `testcases/concurrency_reference.st`，依次执行：

1. ST 转 C；
2. 构建普通运行目标；
3. 生成变量映射；
4. 构建项目输入转换器；
5. 构建 AFL++ 插桩目标。

指定其他输入：

```bash
./scripts/plc-lab build all testcases/matiec/legacy/state_machine.st
```

只执行某一步：

```bash
./scripts/plc-lab build plc testcases/concurrency_reference.st
./scripts/plc-lab build runtime
./scripts/plc-lab build analyze
./scripts/plc-lab build transformer
./scripts/plc-lab build instrumented
```

## 手动构建

### ST 转 C

```bash
./scripts/plc-lab build plc testcases/concurrency_reference.st
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
./scripts/plc-lab build plc testcases/concurrency_reference.st
```

新版和历史 MatIEC 的生成结果不能默认视为等价；比较自动化测试数据时应记录使用的 MatIEC commit 或二进制 SHA-256。

### 普通目标与变量映射

```bash
./scripts/plc-lab build runtime
python3 ./static_analyse/main.py
```

输出：

- `openplc`：非插桩运行目标；
- `plc_variables_mapping.csv`：输入转换器使用的 I/O 与内存变量映射。

### 输入转换器与插桩目标

```bash
./scripts/plc-lab build transformer
./scripts/plc-lab build instrumented
```

如需指定插桩编译包装器，设置项目变量 `PLC_LAB_INSTRUMENTED_CXX`。不要把包装器路径写入 AFL++ 自身使用的下游编译器变量，否则包装器会再次选择自身。

输出：

- `build/input-transformer/libplc_input_transformer.so`：项目输入转换器；
- `openplc_instrumented`：AFL++ 插桩目标；
- `build/runtime/` 与 `build/instrumented/`：互相隔离的对象文件。

## 运行自动化鲁棒性实验

先复制保留的输入样本：

```bash
mkdir -p input_samples
cp -a "seeds copy/." input_samples/
```

运行：

```bash
./scripts/plc-lab experiment
```

脚本默认启用 `build/input-transformer/libplc_input_transformer.so`，并使用仓库内的 `input_generation/plc.grammar`。常用配置：

活动 grammar 和输入转换器生成带 `PLCFUZZ_INPUT_V1` 标头的规范数据；保留的无标头历史种子仍可读取。完整字段顺序和兼容规则见 [PLC 自动化测试输入格式](docs/PLC_INPUT_FORMAT.md)。

`PLCFUZZ_INPUT_V1` 是已经版本化的磁盘兼容标记，不是新的项目命名。旧命令和旧项目变量仍由兼容层接受并提示迁移；AFL++ 规定的名称保持原样。

| 变量 | 默认值 | 用途 |
| --- | --- | --- |
| `EXPERIMENT_DURATION` | `3600` | 运行秒数 |
| `EXECUTION_TIMEOUT` | `10000` | 单次执行超时（毫秒） |
| `INPUT_SAMPLES_DIR` | `input_samples/` | 输入样本目录 |
| `OBSERVATIONS_DIR` | `observations/` | 自动创建独立实验目录的父目录 |
| `EXPERIMENT_DIR` | 未设置 | 本次实验目录；必须是尚不存在的路径 |
| `INPUT_GRAMMAR` | `input_generation/plc.grammar` | grammar 文件 |
| `PLC_LAB_INPUT_TRANSFORMER_LIBRARY` | `build/input-transformer/libplc_input_transformer.so` | 输入转换器 |
| `AUTOMATED_INPUT_TOOL` | `afl-fuzz` | 自动输入生成工具入口 |
| `INSTRUMENTED_TARGET` | `openplc_instrumented` | 插桩目标 |

每次启动都会在 `OBSERVATIONS_DIR` 下创建带时间和仓库版本前缀的独立目录，并在终端打印该路径。目录中的 `manifest.json` 会记录版本、目标摘要、工具版本、机器信息、参数、环境和最终状态；已有结果不会被覆盖。如需指定确切路径，可设置 `EXPERIMENT_DIR`，但该路径必须尚不存在：

```bash
EXPERIMENT_DURATION=60 \
OBSERVATIONS_DIR=output/experiments \
EXPERIMENT_DIR=output/experiments/smoke-test-01 \
./scripts/plc-lab experiment
```

需要进行可比较的重复实验时，使用版本化的[实验评价协议](docs/EVALUATION_PROTOCOL.md)。评价模式要求同时提供协议、基准、策略、重复序号和对应固定 seed，并额外生成可校验的 `evaluation-result.json`；普通开发实验无需设置这些变量。

```bash
EVALUATION_PROTOCOL=evaluation/protocol-v1.json \
EVALUATION_BENCHMARK_ID=example-state-machine \
EVALUATION_STRATEGY_ID=protocol-valid \
EVALUATION_REPLICATE_INDEX=0 \
EVALUATION_REPLICATE_SEED=104729 \
./scripts/plc-lab experiment
```

可用 `./scripts/plc-lab evaluation validate-protocol` 校验维护中的协议。

重放一个 AFL 输入：

```bash
./scripts/plc-lab replay observations/<experiment>/afl-output/default/queue/<input-file>
```

## 测试

```bash
# MatIEC 自身完整测试
MATIEC_RUN_TESTS=1 ./scripts/plc-lab setup

# PLC Robustness Lab 新增的 MatIEC 合法用例
./scripts/plc-lab test testcases

# 代表性基准用例及确定性编译
./scripts/plc-lab benchmarks validate --verify-compiler

# 全部 ST/LD 清单结构与文件覆盖
python3 ./scripts/check_testcase_manifest.py

# 使用固定 MatIEC 核对全部 ST 预期结果
python3 ./scripts/check_testcase_manifest.py --verify-compiler

# 学术范围和维护用语检查
./scripts/check_project_wording.sh

# Linux CI 工作流结构
bash ./scripts/check_ci_workflow.sh

# 活动源码、归档与生成快照一致性
./scripts/check_source_layout.sh

# 输入转换器输入的解析/序列化往返测试
./scripts/plc-lab test unit

# 历史二进制和 findings 完整性
./scripts/verify_preserved_artifacts.sh
```

测试用例总清单见 [testcases/README.md](testcases/README.md)，重点 MatIEC 兼容用例说明见 [testcases/matiec/README.md](testcases/matiec/README.md)。

## 目录

| 路径 | 内容 |
| --- | --- |
| `third_party/matiec/` | 当前 MatIEC submodule |
| `src/`、`include/`、`lib/` | OpenPLC 运行时及 PLC 输入模拟代码 |
| `build_scripts/` | 统一命令调用的底层构建实现 |
| `scripts/` | `plc-lab` 统一入口及语义明确的维护脚本 |
| `input_generation/` | AFL++ grammar、dictionary 与输入转换器 |
| `static_analyse/` | PLC 变量映射提取工具 |
| `testcases/` | 活动 ST/LD 样例、MatIEC 兼容性用例和历史归档 |
| `benchmarks/` | 代表性基准目录、最小回放输入和预期轨迹 |
| `tests/` | PLC Robustness Lab 单元测试 |
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

仓库有意跟踪 `src/glueVars.cpp`、根目录的 `plc_variables_mapping.csv` 和 `tests/fixtures/reference_LOCATED_VARIABLES.h`，三者对应 README 默认 ST 程序的同一份生成结果，使未运行完整工具链的检出也能进行代码审阅和轻量测试。更换参考程序时按以下顺序同时刷新：

```sh
./scripts/plc-lab build plc testcases/concurrency_reference.st
./scripts/plc-lab build runtime
./scripts/plc-lab build analyze
cp plclogic/LOCATED_VARIABLES.h tests/fixtures/reference_LOCATED_VARIABLES.h
./scripts/check_source_layout.sh
```

`runtime` 步骤根据 `plclogic/LOCATED_VARIABLES.h` 刷新 glue 文件，`analyze` 随后直接从这些结构化地址记录重建唯一的活动变量映射。确认结果后，把 `plclogic/LOCATED_VARIABLES.h` 复制为测试参考快照；三份文件应在同一个提交中更新。

## 当前限制

- 并发输出候选的判定目前基于最近输出变化，是实验性启发式，不等价于完整的并发语义证明。
- 13 个不满足新版 MatIEC 要求的历史 ST 文件已移至 `testcases/archive/incompatible-matiec/`，程序逻辑保持不变且不纳入活动语料。
- 默认自动化测试输入格式是固定顺序的文本数值块，grammar、解析器和输入转换器需要同步演进。
- Linux CI 会验证完整 OpenPLC/AFL++ 构建链；本地非 Linux 环境仍可能只覆盖轻量检查。
- 仓库已提供顶层 GPLv3 `LICENSE`；收集的第三方测试语料和实验数据仍需逐项核对来源与再分发权。

更完整的技术债与优先级见 [docs/IMPROVEMENTS.md](docs/IMPROVEMENTS.md)。

## 相关文档

- [可复现环境](REPRODUCIBILITY.md)
- [第三方代码与许可说明](THIRD_PARTY_NOTICES.md)
- [原创文件许可元数据边界](docs/LICENSE_METADATA.md)
- [改进建议](docs/IMPROVEMENTS.md)
- [变更记录](docs/CHANGELOG.md)
- [构建脚本历史说明](build_scripts/README.md)
- [PLC 自动化测试输入格式](docs/PLC_INPUT_FORMAT.md)
- [实验评价协议](docs/EVALUATION_PROTOCOL.md)
- [代表性 PLC 基准用例集](docs/BENCHMARK_SUITE.md)
- [Petri 网实验说明](lunwenfuxian/petrinet/README.md)
