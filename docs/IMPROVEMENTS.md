# PLC Robustness Lab 改进路线图

本路线图按对研究结论可靠性和持续维护的影响排序。当前已有 **20 个主题完成**，**3 个主题待处理**。每个主题均作为独立 OpenSpec change，依次完成探索、提案、实施、验证和归档，并单独提交和推送。

## 已完成

### 输出变化候选判定

`BufferHistory::checkChange()` 现在使用有界窗口、有效样本计数和确定性状态重置，仅把持续输出变化报告为需要复核的候选行为，并通过单元测试覆盖稳定、变化、回绕和重置场景。

OpenSpec：[`stabilize-output-change-oracle`](../openspec/changes/archive/2026-09-08-stabilize-output-change-oracle/)

### 确定性输入转换

所有输入转换决策和值生成均使用 AFL++ 提供的实例级 seed；固定 seed、映射和输入会产生一致结果，且不受进程级随机状态影响。

OpenSpec：[`make-mutator-deterministic`](../openspec/changes/archive/2026-09-08-make-mutator-deterministic/)

### CSV 与配置校验

变量映射已改为实例级状态，并对字段数量、数值、输入位置、变量名和文件可用性进行带路径及行号的显式校验；初始化错误不会越过 C ABI 边界。

OpenSpec：[`make-mutator-deterministic`](../openspec/changes/archive/2026-09-08-make-mutator-deterministic/)

### 版本化输入数据协议

运行时和输入转换器现在共用严格解析器；新数据使用 `PLCFUZZ_INPUT_V1` 标头和固定的 119 字段记录，未知版本、不完整记录及超范围数值会被拒绝。保留的无标头种子继续以只读兼容方式加载。

OpenSpec：[`version-plc-input-format`](../openspec/changes/archive/2026-09-08-version-plc-input-format/)

### 测试语料机器可读清单

`testcases/manifest.tsv` 现在覆盖全部 55 个 ST 和 31 个 LD 文件，记录路径、profile、预期结果、来源与许可核对状态和研究用途。校验器会检查 Git 文件覆盖，并可使用固定 MatIEC 核对全部 ST 预期结果。

OpenSpec：[`catalog-test-corpus`](../openspec/changes/archive/2026-09-08-catalog-test-corpus/)

### 结构化变量映射生成

变量映射现在直接来自 MatIEC 的 `LOCATED_VARIABLES.h` 结构化宏记录，并在写入前校验类型、地址、索引、符号名和重复目标；输出继续使用输入转换器现有的四列 CSV 接口。

OpenSpec：[`generate-structured-variable-map`](../openspec/changes/archive/2026-09-08-generate-structured-variable-map/)

### Linux 持续集成

GitHub Actions 现在在 Ubuntu 22.04 上验证固定 MatIEC、项目测试、普通运行目标、结构化变量映射、输入转换器和固定 AFL++ 5.03c 插桩目标，并使用仓库只读权限。

OpenSpec：[`add-linux-ci`](../openspec/changes/archive/2026-09-08-add-linux-ci/)

### 运行诊断与非正常终止样本整理

普通运行时和自定义输入组件现在提供相互隔离的 ASan/UBSan 构建。样本整理器会按摘要去重，确认稳定信号，在保持行为的前提下最小化，并记录仓库/MatIEC 版本、目标摘要、seed、环境、命令和诊断文本。

OpenSpec：[`add-runtime-diagnostics`](../openspec/changes/archive/2026-09-08-add-runtime-diagnostics/)

### 自动生成实验目录和环境清单

`scripts/plc-lab experiment` 现在为每次启动创建独立目录，并在执行前写入版本化 JSON 清单；清单记录仓库与 MatIEC 版本、工具版本、目标摘要、机器、参数、路径、环境和完整命令，结束时原子写入状态与退出码。显式目录已存在时会拒绝运行。

OpenSpec：[`record-experiment-manifests`](../openspec/changes/archive/2026-09-09-record-experiment-manifests/)

### 原创文件版权与 SPDX 标识

`REUSE.toml` 现在以标准聚合标注覆盖明确的原创实现、测试、脚本、构建配置、文档和 OpenSpec 记录。自动检查会核对路径、`GPL-3.0-only` 标识、完整 GPLv3 文本及代表性上游文件头，并明确排除生成物、历史结果和待核对材料。

OpenSpec：[`add-license-metadata`](../openspec/changes/archive/2026-09-09-add-license-metadata/)

### 第三方测试材料来源与再分发条件

31 个 LD 文件已逐项映射到固定 LDmicro commit、上游路径和 blob，并记录当前文件摘要及“换行归一后一致/本地修改”状态。两个 ST 转换文件保持 LDmicro 衍生归属；其余 ST 文件记录为项目原创。所有测试条目均有明确 SPDX 标识和机器可读来源证据，不再包含待核对占位值。

OpenSpec：[`audit-testcase-provenance`](../openspec/changes/archive/2026-09-09-audit-testcase-provenance/)

### 统一构建与运行脚本入口

`scripts/plc-lab` 现在统一提供 setup、build、run、experiment、replay、test、batch、diagnostics 和 lines 子命令。根目录历史脚本仅保留带迁移提示的参数转发；批量实验改用每个用例独立的实验目录和清单。

OpenSpec：[`unify-script-entrypoints`](../openspec/changes/archive/2026-09-09-unify-script-entrypoints/)

### 强化运行时资源所有权

运行时后备值现在由固定生命周期的 `RuntimeBufferStorage` 统一持有，初始化只补全空槽并保留 MatIEC 生成映射。输入槽位和位偏移使用有界值类型；输入应用与历史采样会先核对全部目标，映射不完整时不产生部分状态。硬件缓冲区互斥锁改由作用域对象管理，内部固定数组改用 `std::array`。

OpenSpec：[`strengthen-runtime-ownership`](../openspec/changes/archive/2026-09-09-strengthen-runtime-ownership/)

### Linux 容器全流程验收

`scripts/build_linux_container.sh` 现在构建固定的 `linux/amd64` 环境，并把仓库检查、MatIEC 全套测试、55 个 ST 预期核对、普通/插桩/诊断构建及代表性输入回放设为镜像构建门槛。机器可读清单记录基础镜像、工具和软件包版本、完整命令及最终本地镜像内容摘要。

OpenSpec：[`verify-linux-container-build`](../openspec/changes/archive/2026-09-09-verify-linux-container-build/)

### GitHub Actions checkout 运行时升级

Linux 质量工作流已从 `actions/checkout@v4` 升级到使用 Node.js 24 的 v5 line，继续保持递归检出固定 MatIEC submodule 和仓库只读权限。结构检查会要求 v5 并阻止旧 v4 配置重新进入工作流。

OpenSpec：[`upgrade-checkout-node-runtime`](../openspec/changes/archive/2026-09-09-upgrade-checkout-node-runtime/)

### Linux 固定工具链构建缓存

Linux 质量工作流现在为 MatIEC 和固定 AFL++ 源码树使用精确构建缓存。缓存键包含系统、架构、编译器版本、固定源码标识和显式 schema；不使用部分匹配恢复前缀。MatIEC 命中缓存后仍清除旧测试结果并重跑全套测试，项目检查和产物核对保持不变。

OpenSpec：[`cache-linux-toolchain-builds`](../openspec/changes/archive/2026-09-09-cache-linux-toolchain-builds/)

### 中性化项目自有标识

项目展示名现在是 **PLC Robustness Lab**，`scripts/plc-lab` 是唯一受维护的统一入口。输入生成源码、输入转换组件、插桩目标、活动测试目录、实验观测目录和项目配置变量均使用中性名称；旧命令与旧变量只通过带迁移提示的兼容层接受。AFL++ 要求的命令、环境变量、ABI 导出及原始统计字段保持原样，自动检查同时覆盖维护文本、路径和项目自有标识。

OpenSpec：[`neutralize-project-owned-identifiers`](../openspec/changes/archive/2026-09-09-neutralize-project-owned-identifiers/)

### 固定实验评价协议

仓库现在提供版本化、机器可读的评价协议，固定七项指标、比较控制项、五组 seed 和汇总规则。评价模式会校验完整实验上下文，将对应 seed 传给输入生成工具，并生成与实验清单及协议摘要关联的结果骨架；缺失指标必须以 null、状态和原因显式记录。

OpenSpec：[`define-experiment-evaluation-protocol`](../openspec/changes/archive/2026-09-09-define-experiment-evaluation-protocol/)

### 代表性基准用例集

`plc-robustness-core-v1` 现在以五类控制模式和三档复杂度构成完整的 15 用例矩阵。每个项目原创 ST 用例都有稳定 ID、变量接口、抽象状态数、预期行为、来源边界、最小 V1 回放输入、预期轨迹和内容摘要；自动检查还能用固定 MatIEC 双重编译并比较生成结果。

OpenSpec：[`add-representative-benchmark-suite`](../openspec/changes/archive/2026-09-09-add-representative-benchmark-suite/)

### 输入生成策略基线比较

版本化策略目录现在明确区分普通字节输入、仅协议约束、当前结构感知和可选状态反馈四种配置。计划工具会按选定基准、三个维护策略和五组固定 seed 生成完整同预算矩阵，核对所有引用摘要与配对覆盖，并一次只执行一个经过验证的 trial；缺少适配器时不会虚构状态反馈结果。

OpenSpec：[`compare-input-generation-baselines`](../openspec/changes/archive/2026-09-09-compare-input-generation-baselines/)

## 待处理

### 实验分析报告

汇总重复运行，按稳定摘要去重，输出 CSV、JSON、统计区间与静态图表，并记录失败、缺失数据和可回放样本位置。

### 项目自有代码覆盖率

分别统计 C++ 与 Python 项目代码，排除 MatIEC 和生成代码，在 CI 记录基线并逐步设置合理门槛。

### 离线运行时模块化

拆分运行时入口与通信兼容实现，将周期调度、输入应用、状态观测和结果记录分层，并隔离第三方生成头文件的编译提示。
