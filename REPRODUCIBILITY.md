# 可复现环境

PLCFuzz 同时保留两套需要区分的基线：当前开发基线使用仓库固定的 MatIEC submodule；历史实验基线使用仓库保存的旧二进制。比较测试结果时必须记录所用基线，二者生成的 C 代码不应默认视为等价。

## 当前开发基线

| 项目 | 版本或不可变标识 |
| --- | --- |
| MatIEC | `third_party/matiec` gitlink，当前为 `cc7cb0250fc3199e726fb43260c180727fd4d128` |
| MatIEC 来源 | `https://github.com/mengmengjiang1999/matiec.git` |
| 容器基础系统 | Ubuntu 22.04，digest `sha256:23bda685...92216ccf` |
| AFL++ | `v4.10c` |
| OpenPLC v3 上游源码 | `091524e1d80120cbe6b2c130822e91369f12eccd` |
| C/C++ 标准 | PLCFuzz 运行时使用 GNU++11；自定义变异器使用 C++11 |
| Python | Python 3，仅依赖标准库 |

首次克隆必须初始化 submodule：

```sh
git clone --recurse-submodules https://github.com/mengmengjiang1999/plcfuzz.git
cd plcfuzz
./scripts/setup_matiec.sh
```

已有工作树可执行：

```sh
git submodule update --init --recursive
./scripts/setup_matiec.sh
```

若要同时运行 MatIEC 自身测试：

```sh
MATIEC_RUN_TESTS=1 ./scripts/setup_matiec.sh
```

## 历史实验基线

原始实验在 x86-64 Ubuntu 22.04 下运行。`artifacts/legacy/matiec/iec2c` 和 `artifacts/legacy/openplc_fuzz` 中的编译器标记包含 GCC 11.4/12.3 与 Ubuntu 22.04 信息，历史 `fuzzer_stats` 记录了 AFL++ 4.10c。

历史 MatIEC 二进制及生成器位于：

- `artifacts/legacy/matiec/iec2c`
- `artifacts/legacy/matiec/iec2iec`
- `artifacts/legacy/matiec/tmp.yy`
- `tools/glue_generator`
- `artifacts/legacy/openplc_fuzz`

这些文件是不可变复现材料，不是当前默认工具链。其精确 MatIEC 源码 commit 仍无法仅凭二进制可靠反推。

## 构建容器

在仓库根目录执行：

```sh
docker build --platform linux/amd64 -f Dockerfile.repro -t plcfuzz:repro .
docker run --rm -it --platform linux/amd64 -v "$PWD:/workspace/plcfuzz" plcfuzz:repro
```

构建上下文中必须包含已初始化的 `third_party/matiec`。Apple Silicon 主机应显式使用 `linux/amd64`，因为保留的历史 MatIEC、OpenPLC 和 glue generator 二进制是 x86-64 ELF 文件；当前 MatIEC 本身可以在 macOS 上从源码构建。

Dockerfile 固定 OpenPLC 和 AFL++ 上游版本，并在镜像的 `/opt/upstream` 中保留源码。OpenPLC 提供项目链接的 OpenDNP3 和 libmodbus。由于原复现环境的网络限制，Ubuntu APT 使用阿里云镜像；包内容仍来自 Ubuntu 22.04 amd64。

## 当前编译流程

```sh
./scripts/verify_preserved_artifacts.sh
./scripts/check_source_layout.sh
./scripts/validate_testcases.sh
./scripts/test_unit.sh
./buildscript.sh
```

`buildscript.sh` 默认把 `testcases/race_test_success.st` 转为 C，然后依次构建普通运行目标、生成变量映射、构建自定义变异器和 AFL++ 插桩目标。

当前输入回放语义规定每个 OpenPLC 周期只推进每种输入类型一次。修复前的运行时会在同一周期重复推进 simulator，且把 UINT 输入误接到 UDINT 数据；因此修复前后的 findings 不能直接作为同一运行时基线比较，实验记录必须包含仓库 commit。

当前输出变化 oracle 只比较实际记录的 history 样本，并按环形缓冲区的时间顺序处理。旧版本会把未写入的零值槽位加入比较，因此旧 findings 还可能包含初始化导致的候选；跨版本评估必须分别记录 oracle 所在的仓库 commit。输出变化仍只是候选信号，不等价于严格的数据竞争证明。

每个输入默认执行 100 个 PLC 周期，并且不主动等待墙钟时间，以保持 fuzzing 吞吐量。可按实验需要设置：

```sh
PLCFUZZ_CYCLE_COUNT=250 \
PLCFUZZ_CYCLE_DELAY_NS=50000000 \
./openplc_fuzz seeds/example
```

`PLCFUZZ_CYCLE_COUNT` 必须是正整数；`PLCFUZZ_CYCLE_DELAY_NS` 是非负的纳秒数。后者只控制宿主机的绝对时钟休眠，不改变 MatIEC 的 `common_ticktime__` 或 IEC 程序逻辑时间。运行摘要中的 latency 是实际唤醒时刻相对绝对截止时刻的非负迟到量；关闭墙钟 pacing 时该值为零。复现实验必须记录这两个变量，未设置时分别记为 `100` 和 `0`。

自定义变异器的随机流完全由 AFL++ 传入的 seed 驱动；在相同构建、映射和输入下，相同 seed 的首次变异结果一致，不再受进程全局 `random()` 状态影响。变量映射默认读取当前目录的 `plc_variables_mapping.csv`；从其他目录启动或比较不同 PLC 程序时，应显式记录并设置：

```sh
PLCFUZZ_VARIABLE_MAPPING=/workspace/plcfuzz/plc_variables_mapping.csv \
FINDINGS_DIR=output/reproduction \
./runfuzz.sh
```

映射文件缺失或存在不完整、越界、非数字字段时，变异器会在初始化阶段报告具体文件和行号并拒绝启动，避免退化成没有变量级变异的实验。

只验证 ST 到 C：

```sh
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
test -s ./plclogic/Config0.c
test -s ./plclogic/Res0.c
```

使用历史编译器复现旧生成结果：

```sh
MATIEC_IEC2C=./artifacts/legacy/matiec/iec2c \
MATIEC_INCLUDE_DIR=./lib \
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
```

## 复现模糊测试

原始种子保存在 `seeds copy/`。复制后运行，避免修改保留材料：

```sh
mkdir -p seeds
cp -a "seeds copy/." seeds/
FINDINGS_DIR=output/reproduction ./runfuzz.sh
```

`runfuzz.sh` 默认运行 3600 秒，单次执行超时 10000 ms。为每次实验设置独立的 `FINDINGS_DIR`，不要覆盖仓库内的 `findings/` 和 `findings copy/`。

## 已知限制

- Ubuntu APT 软件包尚未按包哈希封存；论文归档还应记录成功构建后的最终镜像 digest。
- 13 个不能通过当前 MatIEC profile 的历史 ST 文件已原样归档到 `testcases/archive/incompatible-matiec/`，不计入活动语料或新增合法用例套件。
- 历史统计和笔记中可能包含原实验机绝对路径；这些只是元数据，不再被当前脚本使用。
- 当前没有远端 CI，完整 OpenPLC/AFL++ 构建仍以 x86-64 Linux 为权威环境。

## 记录一次实验

至少记录仓库 commit、MatIEC gitlink、镜像 digest、CPU、内存、内核、AFL++ 版本、`fuzzer_stats` 和实际命令行：

```sh
git rev-parse HEAD
git -C third_party/matiec rev-parse HEAD
afl-fuzz --version
uname -a
lscpu
free -h
sha256sum \
  artifacts/legacy/matiec/iec2c \
  artifacts/legacy/matiec/iec2iec \
  tools/glue_generator \
  artifacts/legacy/openplc_fuzz
```
