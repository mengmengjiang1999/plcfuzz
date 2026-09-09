# LDmicro 测试材料来源

本目录的 31 个 `.ld` 文件来自 [LDmicro 官方仓库](https://github.com/LDmicro/LDmicro)；核对基线固定为 commit `5b058e05103d85a93c9b91807307b1bd44ee0925`。逐文件上游路径、Git blob、当前文件 SHA-256 和比较结果记录在 [`SOURCE.tsv`](SOURCE.tsv)。

LDmicro 的 `manual.txt` 声明该程序按 GNU GPL version 3 或任何后续版本提供。仓库顶层 [`LICENSE`](../../LICENSE) 保留了完整 GPL version 3 文本；分发这些材料时还应保留本说明、`SOURCE.tsv`、[`provenance.tsv`](../provenance.tsv) 和 LDmicro 归属。

比较结果中：

- `normalized-equivalent` 表示移除 CR 换行差异后与固定上游 blob 一致；
- `modified` 表示本地内容与固定上游 blob 不同，不能描述为未修改副本。

当前结果为 13 个 `normalized-equivalent`、18 个 `modified`。本核对只记录来源和许可条件，不改变任何测试程序内容。
