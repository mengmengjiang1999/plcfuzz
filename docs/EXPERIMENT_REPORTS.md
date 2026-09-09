# 实验分析报告

`scripts/plc-lab report` 把新版评价实验目录汇总为可审阅、可再次校验的静态报告。它递归查找 `evaluation-result.json`，跟随并校验对应 `manifest.json` 和协议摘要；历史统计文件不会被自动解释成新版指标。

## 生成

```bash
./scripts/plc-lab report generate \
  --input-root output/comparison-runs \
  --output-dir output/comparison-report

./scripts/plc-lab report validate output/comparison-report
```

输出目录必须尚不存在或为空，工具不会覆盖已有报告。实验输入保持只读。输出包含：

- `report.json`：全部运行索引、原始完整指标值、汇总统计、失败运行、缺失数据、稳定观测索引和产物清单；
- `summary.csv`：每个 benchmark/strategy/metric 组一行；
- `charts/<metric>.svg`：每项 trial 指标一个无需外部资源的静态图；
- 报告中的绝对 manifest、result 和 replay sample 路径：用于直接返回原始证据。

## 统计规则

只有 `status=complete` 的有限数值进入汇总。每组保留原始值并计算数量、均值、中位数、样本标准差、最小值、最大值和 bootstrap percentile 95% 区间。bootstrap 使用由组键导出的固定 seed 和固定 2000 次重采样，因此相同输入会生成相同结果。单个值的区间退化为该值，样本标准差为 null。

`pending` 和 `unavailable` 指标进入 `missing_metrics`，不会变成零。非 `success` 运行进入 `failed_runs`，其中已经明确完成的指标仍保留，但报告不会隐藏该运行状态。相同 benchmark 的机器、目标、仓库、MatIEC、工具、时限和 PLC 周期控制项不一致时拒绝合并。

## 稳定摘要与回放定位

评价结果可选地声明：

```json
{
  "observations": [
    {
      "stable_digest": "<64 lowercase hex characters>",
      "replay_sample": "relative/path/to/sample"
    }
  ]
}
```

路径必须相对实验目录且不能向上跳转。相同稳定摘要在多个运行中出现时，报告只创建一个 observation 条目，但保留所有 run 和 replay 路径；文件缺失会进入缺失数据列表。稳定摘要用于整理候选观测，不自动表示某种确定的软件缺陷。

报告校验会重算全部统计，核对 CSV 行、SVG 清单和可用回放路径。需要修改结果时应保留原始实验目录，生成一个新的报告目录。
