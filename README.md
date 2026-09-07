# PLCFuzz

PLCFuzz 是一个面向 PLC 程序的研究型模糊测试原型。项目将 IEC 61131-3 Structured Text（ST）程序转换为 C 代码，构建基于 OpenPLC 的执行目标，分析 PLC 变量映射，并通过 AFL++ 和自定义变异器生成结构化输入，用于发现 PLC 控制逻辑中的崩溃、竞争状态等异常行为。

> 本仓库主要用于实验复现，不是可直接部署到生产控制系统的 OpenPLC 发行版。历史 findings、预编译工具和实验结果均属于研究材料，请勿在整理构建产物时直接删除。

## 工作流程

```text
Structured Text 测试程序
        │
        ▼
MatIEC（tools/iec2c）
        │
        ▼
生成的 PLC C 代码（plclogic/）
        │
        ├── OpenPLC 运行时 ──────────────► openplc / openplc_fuzz
        │
        └── 变量映射静态分析 ───────────► plc_variables_mapping.csv
                                               │
                                               ▼
                                  AFL++ 自定义变异器
                                               │
                                               ▼
                                      findings/ 与 results/
```

核心流程包括：

1. 使用 MatIEC 将 ST 程序转换为 C 代码。
2. 将生成代码与 OpenPLC 运行时编译为普通目标 `openplc`。
3. 从 `src/glueVars.cpp` 提取参与测试的 PLC 输入、输出和内存变量。
4. 构建 AFL++ 自定义变异器 `libplc_mutator.so`。
5. 构建插桩目标 `openplc_fuzz` 并运行模糊测试。

## 环境要求

推荐在 **x86-64 Ubuntu 22.04** 中复现实验。仓库保留的 MatIEC/OpenPLC 工具是 Linux x86-64 ELF 文件，不能在 macOS 上直接运行。

主要依赖：

- GCC/G++，支持 GNU++11
- CMake、Make、pkg-config
- Python 3
- AFL++ 4.10c
- OpenDNP3
- libmodbus
- MatIEC（仓库的 `tools/` 中保留了历史实验所用二进制）

精确版本、上游提交和已知限制见 [REPRODUCIBILITY.md](REPRODUCIBILITY.md)。第三方代码来源和许可状态见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

## MatIEC 版本策略

PLCFuzz 支持两种 MatIEC 使用方式：

| 场景 | 编译器 | 说明 |
| --- | --- | --- |
| 历史实验复现 | `tools/iec2c` | 默认方式；二进制有固定 SHA-256，用于尽可能还原原实验 |
| 新开发与兼容性测试 | [`mengmengjiang1999/matiec`](https://github.com/mengmengjiang1999/matiec) | 维护中的新版编译器，具有现代化构建、测试和实验性语言 profile |

新版 MatIEC 保留 `iec2c`、`iec2iec` 和默认 `legacy` profile，同时提供可选的 `iec61131-3:2025-experimental` profile。后者包含 UTF-8 字符串、引用初始化、命名空间、功能块方法和配置级 `VAR_ACCESS` 等实验性能力，但不表示完整或经认证的 IEC 61131-3:2025 符合性。

在相邻目录构建新版 MatIEC：

```bash
git clone git@github.com:mengmengjiang1999/matiec.git ../matiec
cd ../matiec
autoreconf --install
./configure
make --jobs=2
make check
cd ../plcfuzz
```

使用新版 MatIEC 的兼容模式转换 PLCFuzz 测试程序：

```bash
MATIEC_IEC2C=../matiec/iec2c \
MATIEC_INCLUDE_DIR=../matiec/lib \
MATIEC_STD=legacy \
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
```

要专门测试新版实验语法，可将 `MATIEC_STD` 改为 `iec61131-3:2025-experimental`。新版编译器产生的 C 代码可能与历史二进制不同，因此这类结果应作为新的实验批次记录，不能直接与历史 AFL++ 数据混合比较。

## 使用 Docker 复现

Dockerfile 会构建 Ubuntu 22.04、AFL++ 4.10c、OpenDNP3 和 libmodbus 环境：

```bash
docker build --platform linux/amd64 \
  -f Dockerfile.repro \
  -t plcfuzz:repro .

docker run --rm -it --platform linux/amd64 \
  -v "$PWD:/workspace/plcfuzz" \
  plcfuzz:repro
```

进入容器后先校验仓库保留的工具和实验材料：

```bash
./scripts/verify_preserved_artifacts.sh
```

然后执行默认构建流程：

```bash
./buildscript.sh
```

默认测试程序是 `testcases/race_test_success.st`。

## 手动构建

下面的命令均在仓库根目录执行。

### 1. 将 ST 转换为 C

```bash
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
```

生成文件位于 `plclogic/`，主要包括 `Config0.c`、`Res0.c` 和 `LOCATED_VARIABLES.h`。

转换脚本默认使用 `tools/iec2c`，也接受以下环境变量：

- `MATIEC_IEC2C`：指定其他 `iec2c` 可执行文件；
- `MATIEC_INCLUDE_DIR`：传给 MatIEC 的库/include 目录；
- `MATIEC_STD`：选择 `legacy` 或其他受编译器支持的语言 profile；
- `PLCLOGIC_DIR`：覆盖生成代码的输出目录。

### 2. 构建普通执行目标

```bash
make
```

该步骤生成 `openplc`，同时根据 `LOCATED_VARIABLES.h` 生成 `src/glueVars.cpp`。

### 3. 提取 PLC 变量映射

```bash
python3 ./static_analyse/main.py
```

分析结果写入根目录的 `plc_variables_mapping.csv`。自定义变异器根据该映射只变异目标 PLC 变量。

### 4. 构建自定义变异器和插桩目标

```bash
./build_scripts/build_shared_library.sh
./build_scripts/buildfuzz.sh
```

生成的主要文件：

- `build/libplc_mutator.so`：AFL++ 自定义变异器
- `openplc_fuzz`：AFL++ 插桩目标

也可以使用组合脚本依次完成以上步骤：

```bash
./buildscript.sh
```

`buildscript.sh` 还支持分别执行某一步：

```bash
./buildscript.sh plc
./buildscript.sh c
./buildscript.sh analyze
./buildscript.sh lib
./buildscript.sh fuzz
./buildscript.sh all
```

## 运行

普通运行：

```bash
./run.sh
```

运行 AFL++ 前，将仓库保留的原始种子复制到工作目录：

```bash
mkdir -p seeds
cp -a "seeds copy/." seeds/
./runfuzz.sh
```

当前 `runfuzz.sh` 默认：

- 运行 3600 秒；
- 单次执行超时 10000 ms；
- 使用 `fuzz_config/plc.grammar`；
- 将结果写入 `findings/`。

运行前请备份已有 `findings/`，或者在独立 Git worktree 中实验，以免覆盖历史结果。

批量运行 `testcases/auto_race/auto1.st` 至 `auto12.st`：

```bash
./run_fuzz_all.sh
```

每个样例的 `fuzzer_stats` 和 `plot_data` 会被复制到 `results/`。

## 目录结构

| 路径 | 内容 |
| --- | --- |
| `src/`、`include/`、`lib/` | OpenPLC 运行时及 PLC 输入模拟相关代码 |
| `tools/` | 实验所用 MatIEC 与 glue generator 二进制 |
| `testcases/` | ST/LD 测试程序和竞争状态样例 |
| `build_scripts/` | PLC 转换、目标构建和变异器构建脚本 |
| `static_analyse/` | 从 `glueVars.cpp` 提取变量映射的脚本 |
| `fuzz_config/` | AFL++ grammar、dictionary 与自定义变异器 |
| `seeds copy/` | 保留的原始种子；运行时复制到 `seeds/` |
| `findings/`、`findings copy/` | 历史 AFL++ 队列、崩溃和统计数据 |
| `results/` | 批量实验提取的统计结果 |
| `lunwenfuxian/petrinet/` | 梯形图到 Petri 网及竞争状态分析实验 |

## 自定义测试程序

要测试新的 ST 文件：

1. 将文件放入 `testcases/`。
2. 使用 `build_scripts/build_plcfiles.sh` 指定该文件。
3. 重新执行普通目标构建和静态分析。
4. 重新构建自定义变异器及插桩目标。
5. 准备与输入结构相匹配的种子并运行 AFL++。

例如：

```bash
./build_scripts/build_plcfiles.sh ./testcases/example.st
make
python3 ./static_analyse/main.py
./build_scripts/build_shared_library.sh
./build_scripts/buildfuzz.sh
./runfuzz.sh
```

## 实验材料与可复现性

- `findings/`、`findings copy/` 和 `results/` 包含历史实验材料，不应当作普通缓存清理。
- `tools/iec2c`、`tools/iec2iec`、`tools/glue_generator` 和根目录的 `openplc_fuzz` 是为复现实验保留的二进制。
- 可使用 `scripts/verify_preserved_artifacts.sh` 校验这些二进制的 SHA-256。
- 发表或归档实验时，应记录仓库 commit、容器镜像 digest、CPU、内核、内存、AFL++ 版本和完整命令行。

## 已知限制

- 这是研究原型，部分脚本仍包含原实验机路径或特定环境假设。
- `runfuzz.sh` 会写入固定的 `findings/` 目录，不适合并发启动多个实例。
- 当前没有自动化测试或 CI；最可靠的验证方式是在复现容器中执行完整构建链。
- 仓库尚未提供顶层 `LICENSE`，项目原创部分的再分发权限尚未明确；第三方组件仍受各自许可证约束。

## 相关文档

- [可复现环境与实验记录要求](REPRODUCIBILITY.md)
- [第三方代码与许可说明](THIRD_PARTY_NOTICES.md)
- [新版 MatIEC 项目](https://github.com/mengmengjiang1999/matiec)
- [构建脚本说明](build_scripts/Readmd.md)
- [PLC 代码安全文献综述](PLC代码安全的文献综述.md)
- [Petri 网实验说明](lunwenfuxian/petrinet/readme.md)
