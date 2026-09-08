# PLCFuzz 改进路线图

本路线图按对研究结论可靠性和持续维护的影响排序。当前已有 **3 个主题完成**，另有 **11 个主题待处理**。每个待处理主题都应作为独立 OpenSpec change，依次完成探索、提案、实施、验证和归档，并在单独提交推送后更新本页状态。

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

## P0：研究结论可靠性

### 1. 固定并版本化输入数据协议

建议 change：`version-plc-input-format`

运行时、grammar、种子解析器和自定义变异器依赖同一套固定顺序文本格式，但目前没有版本字段或单一 schema。应定义格式规范与版本号，由一处实现负责解析和序列化，并覆盖无效输入、边界值、截断输入和兼容性场景。

### 2. 为历史测试语料建立机器可读清单

建议 change：`catalog-test-corpus`

新版 MatIEC 扫描中有 23 个历史 ST 文件通过、13 个文件已移至 `testcases/archive/incompatible-matiec/`。应增加机器可读 manifest，记录原路径、预期 profile、预期结果、来源、许可和研究用途，并用脚本检查清单与文件树一致。

## P1：自动化与结果分析

### 3. 改用结构化变量映射数据源

建议 change：`generate-structured-variable-map`

`static_analyse/main.py` 当前用正则解析生成的 `src/glueVars.cpp`，容易受排版变化影响。应优先从 OpenPLC 的 `VARIABLES.csv`、MatIEC 符号信息或 glue generator 的结构化输出生成映射，并用集成测试核对变量数量、类型和地址。

### 4. 建立 Linux CI

建议 change：`add-linux-ci`

Linux CI 应执行 submodule 初始化、MatIEC 构建与测试、合法用例验证、PLCFuzz 单元测试、普通目标构建、自定义变异器构建以及 AFL++ 插桩目标构建。缓存只用于加速依赖，不应绕过固定 commit 检查。

### 5. 增加运行诊断配置与异常样本整理流程

建议 change：`add-runtime-diagnostics`

为普通目标和自定义变异器增加 ASan/UBSan 配置。对 AFL++ 记录的非正常终止样本执行去重、最小化、稳定复现和调用栈采集，并保存编译器 commit、目标摘要、seed、环境和命令。

### 6. 自动记录实验目录和 manifest

建议 change：`record-experiment-manifests`

每次实验应使用独立目录并生成 manifest，包括 Git commit、MatIEC commit、目标摘要、AFL++ 版本、机器信息、超时、持续时间和相关环境变量，从而避免覆盖历史记录并支持跨版本比较。

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
