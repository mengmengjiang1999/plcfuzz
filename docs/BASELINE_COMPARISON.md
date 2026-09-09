# 输入生成策略对照

本项目用 `evaluation/strategies-v1.json` 固定输入生成策略语义，并用 `scripts/plc-lab comparison` 生成成对、同预算的试验计划。对照只用于经过授权的离线 PLC 软件质量实验。

## 策略

| ID | grammar | 项目适配器 | 状态 |
| --- | --- | --- | --- |
| `random-bytes` | 关闭 | 关闭 | 可用；普通字节级输入变化 |
| `protocol-valid` | 开启 | 关闭 | 可用；只约束版本化数据协议 |
| `structure-aware` | 开启 | 开启 | 可用；保持当前 grammar、内置操作和变量映射适配器的组合行为 |
| `state-feedback` | 开启 | 外部提供 | 可选；默认不可用，不会由其他策略代替 |

前三项逐步增加协议和结构信息，因此可以量化结构信息是否改善有效输入比例、路径覆盖变化、状态转换和稳定观测等协议指标。`random-bytes` 产生较多无效输入是需要测量的结果，不是执行失败。

`state-feedback` 只定义适配边界。只有显式提供经过单独审阅、与固定 AFL++ ABI 兼容的本地适配器文件时才会进入计划；本 change 不实现也不虚构该策略的实验结果。

## 生成计划

下面的命令读取 15 个基准、3 个维护策略和 5 个固定 seed，生成 225 个 trial。所有 trial 共用一组持续时间、单次超时、输入集合和 grammar：

```bash
./scripts/plc-lab comparison generate \
  --duration 3600 \
  --timeout 10000 \
  --output output/comparison-plan.json

./scripts/plc-lab comparison validate output/comparison-plan.json
```

可重复传入 `--benchmark-id` 生成较小但仍包含全部策略和五组配对 seed 的预检计划。计划记录协议、策略目录、基准目录、每个 ST、输入集合、grammar 和可选适配器的 SHA-256；引用内容变化后旧计划会拒绝执行。

## 执行单个 trial

先用 `--print-only` 审阅选择：

```bash
./scripts/plc-lab comparison run output/comparison-plan.json \
  --trial-id timer-simple--structure-aware--r0 \
  --print-only
```

去掉 `--print-only` 后，命令从计划中的 ST 构建当前目标与变量映射，再通过既有评价清单流程启动一次实验。可用 `--experiment-dir` 指定尚不存在的输出目录。每次只执行一个 trial，便于调度器或作业系统独立重试；计划完整性由校验器保证。

比较时必须按 benchmark 和固定 seed 配对，不能把不同程序、机器、时限、目标版本或输入集合的结果直接合并。指标定义和缺失值规则见[实验评价协议](EVALUATION_PROTOCOL.md)，最终汇总留给后续自动报告 change。
