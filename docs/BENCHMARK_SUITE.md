# 代表性 PLC 基准用例集

`benchmarks/manifest-v1.json` 定义 `plc-robustness-core-v1`：一个用于离线 PLC 软件质量比较的平衡基准集。它包含定时器、计数器、状态机、互锁和顺序控制五类程序，每类各有 simple、general、complex 三个等级，共 15 个用例。

## 边界与用途

版本一的 15 个 ST 程序全部由项目编写，采用 `GPL-3.0-only`，不混入第三方或转换材料。机器可读 schema 仍保留 `project-authored`、`third-party` 和 `transformed` 三种来源分类，后续增加材料时必须明确边界、许可和证据。

这些小程序用于在相同预算下比较输入生成策略，不代表所有工业 PLC 工作负载，也不用于生产控制。复杂度是套件内部的结构分层：simple 具有一个主要转换，general 包含更多分支或并行状态，complex 包含更长的持久状态序列；它不是通用的软件复杂度评分。

## 目录

- `testcases/benchmarks/*.st`：使用 MatIEC `legacy` profile 的程序；
- `benchmarks/replay/*.txt`：带 `PLCFUZZ_INPUT_V1` 版本标头的最小多步回放输入；
- `benchmarks/traces/*.json`：与回放记录逐步对应的输入与预期阶段；
- `benchmarks/manifest-v1.json`：稳定 ID、分类、复杂度、变量接口、抽象状态数、预期行为、来源和全部 SHA-256；
- `scripts/check_benchmark_suite.py`：结构、内容及可选编译确定性校验；
- `scripts/generate_benchmark_suite.py`：从受维护的用例定义刷新回放、轨迹和清单摘要。

`modeled_state_count` 表示文档化的逻辑控制状态数量，不是所有数据值组合的总数。轨迹用于固定最小回放意图；当前校验不把轨迹自动等同于运行时测量，后续的离线观测分层会加强这一连接。

## 验证

快速验证目录、五乘三矩阵、接口、来源、摘要、输入协议和轨迹：

```bash
./scripts/plc-lab benchmarks validate
```

再使用固定 MatIEC 将每个程序在两个隔离目录中编译，比较生成文件集合和内容摘要：

```bash
./scripts/plc-lab benchmarks validate --verify-compiler
```

修改 ST、回放或定义后运行 `python3 scripts/generate_benchmark_suite.py` 刷新派生文件，再审阅所有清单差异。实验记录应使用 manifest 中的稳定 benchmark ID，并继续遵守版本化[实验评价协议](EVALUATION_PROTOCOL.md)。
