# 许可元数据边界

仓库原创部分采用 `GPL-3.0-only`，完整的 GNU GPL version 3 文本位于顶层 [`LICENSE`](../LICENSE)。[`REUSE.toml`](../REUSE.toml) 使用 REUSE 1.0 聚合标注，为明确的原创实现、测试、脚本、构建定义、项目文档、工作流和 OpenSpec 记录提供机器可读的版权及 SPDX 信息。

聚合标注不改变已有文件内容，也不会替代上游文件自身的版权和许可通知。分发源码时应同时保留顶层 `LICENSE`、`REUSE.toml`、[`THIRD_PARTY_NOTICES.md`](../THIRD_PARTY_NOTICES.md) 和所有上游文件头。

以下内容不纳入原创文件聚合标注：

- `third_party/matiec/` submodule；
- `src/`、`include/` 和 `lib/` 中带有上游归属的 OpenPLC、MatIEC/Beremiz 或其他继承文件；
- `plclogic/`、变量映射等生成物；
- `artifacts/`、`findings*` 和 `results/` 中的历史复现材料；
- `testcases/`、`seeds copy/` 和研究数据中仍待逐项核对来源与再分发条件的材料；
- `.codex/` 与 `.cursor/` 中随 OpenSpec 工具提供的辅助说明。

新增原创文件时，应将路径纳入 `REUSE.toml` 的聚合标注，或者直接添加适合其文件格式的 `SPDX-FileCopyrightText` 与 `SPDX-License-Identifier`。不确定来源的材料不得直接归入原创范围，应先完成来源核对。

运行以下命令检查元数据格式、受 Git 跟踪的路径、原创文件覆盖边界和代表性上游通知：

```sh
python3 scripts/check_license_metadata.py
```
