# PLCFuzz 改进路线图

本路线图按对研究结论可靠性和持续维护的影响排序。当前已有 **9 个主题完成**，另有 **5 个主题待处理**。每个待处理主题都应作为独立 OpenSpec change，依次完成探索、提案、实施、验证和归档，并在单独提交推送后更新本页状态。

## 已完成

### 输出变化候选判定

`BufferHistory::checkChange()` 现在使用有界窗口、有效样本计数和确定性状态重置，仅把持续输出变化报告为需要复核的候选行为，并通过单元测试覆盖稳定、变化、回绕和重置场景。

OpenSpec：[`stabilize-output-change-oracle`](../openspec/changes/archive/2026-09-08-stabilize-output-change-oracle/)

### 确定性自定义变异

所有变异决策和值生成均使用 AFL++ 提供的实例级 seed；固定 seed、映射和输入会产生一致结果，且不受进程级随机状态影响。

OpenSpec：[`make-mutator-deterministic`](../openspec/changes/archive/2026-09-08-make-mutator-deterministic/)

### CSV 与配置校验

变量映射已改为实例级状态，并对字段数量、数值、输入位置、变量名和文件可用性进行带路径及行号的显式校验；初始化错误不会越过 C ABI 边界。

OpenSpec：[`make-mutator-deterministic`](../openspec/changes/archive/2026-09-08-make-mutator-deterministic/)

### 版本化输入数据协议

运行时和自定义变异器现在共用严格解析器；新数据使用 `PLCFUZZ_INPUT_V1` 标头和固定的 119 字段记录，未知版本、不完整记录及超范围数值会被拒绝。保留的无标头种子继续以只读兼容方式加载。

OpenSpec：[`version-plc-input-format`](../openspec/changes/archive/2026-09-08-version-plc-input-format/)

### 测试语料机器可读清单

`testcases/manifest.tsv` 现在覆盖全部 40 个 ST 和 31 个 LD 文件，记录路径、profile、预期结果、来源与许可核对状态和研究用途。校验器会检查 Git 文件覆盖，并可使用固定 MatIEC 核对全部 ST 预期结果。

OpenSpec：[`catalog-test-corpus`](../openspec/changes/archive/2026-09-08-catalog-test-corpus/)

### 结构化变量映射生成

变量映射现在直接来自 MatIEC 的 `LOCATED_VARIABLES.h` 结构化宏记录，并在写入前校验类型、地址、索引、符号名和重复目标；输出继续使用自定义变异器现有的四列 CSV 接口。

OpenSpec：[`generate-structured-variable-map`](../openspec/changes/archive/2026-09-08-generate-structured-variable-map/)

### Linux 持续集成

GitHub Actions 现在在 Ubuntu 22.04 上验证固定 MatIEC、项目测试、普通运行目标、结构化变量映射、自定义变异器和固定 AFL++ 5.03c 插桩目标，并使用仓库只读权限。

OpenSpec：[`add-linux-ci`](../openspec/changes/archive/2026-09-08-add-linux-ci/)

### 运行诊断与非正常终止样本整理

普通运行时和自定义输入组件现在提供相互隔离的 ASan/UBSan 构建。样本整理器会按摘要去重，确认稳定信号，在保持行为的前提下最小化，并记录仓库/MatIEC 版本、目标摘要、seed、环境、命令和诊断文本。

OpenSpec：[`add-runtime-diagnostics`](../openspec/changes/archive/2026-09-08-add-runtime-diagnostics/)

### 自动生成实验目录和环境清单

`runfuzz.sh` 现在为每次启动创建独立目录，并在执行前写入版本化 JSON 清单；清单记录仓库与 MatIEC 版本、工具版本、目标摘要、机器、参数、路径、环境和完整命令，结束时原子写入状态与退出码。显式目录已存在时会拒绝运行。

OpenSpec：[`record-experiment-manifests`](../openspec/changes/archive/2026-09-09-record-experiment-manifests/)

## P2：发布与长期维护

### 7. 补充版权与 SPDX 标识

建议 change：`add-license-metadata`

为原创文件补充版权和 SPDX 标识，并添加第三方组件所需的完整 `LICENSES/` 文本。

### 8. 核对第三方测试材料来源

建议 change：`audit-testcase-provenance`

核对第三方测试用例的来源、许可状态和再分发条件，并把结果写入机器可读清单和第三方说明。

### 9. 统一构建与运行脚本入口

建议 change：`unify-script-entrypoints`

将 `buildscript_new.sh` 等历史入口迁移为语义明确的 `scripts/` 命令，并保留带弃用提示的兼容包装器。

### 10. 强化运行时资源所有权

建议 change：`strengthen-runtime-ownership`

继续用 RAII、明确所有权和强类型地址替代裸指针、整数索引与全局状态，重点检查 history buffer 的空指针和越界行为。

### 11. 完成 Linux 容器全流程验收

建议 change：`verify-linux-container-build`

为 README 中的 Linux 全流程提供可重复的容器验收，记录基础镜像、依赖版本、最终镜像摘要和全部验证命令。
