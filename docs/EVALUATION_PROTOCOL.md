# 实验评价协议

本协议用于经过授权的离线 PLC 软件质量实验。它规定如何形成可比较的重复实验，不对生产设备、现场系统或外部服务进行操作。

机器可读协议位于 `evaluation/protocol-v1.json`，协议标识是 `plc-robustness-comparison-v1`。修改指标含义、比较控制项或重复规则时必须创建新版本，不能静默覆盖现有协议。

## 研究问题

1. 在相同程序、输入样本、运行时限和工具链下，不同输入生成策略获得的有效输入比例和代码路径覆盖变化是否不同？
2. 不同策略观察到的 PLC 状态转换和唯一候选行为数量是否不同？
3. 候选行为能否稳定回放，首次出现所需时间是否稳定？
4. 上述指标在固定的多组 seed 之间有多大波动？

这些指标用于比较实验行为，不把候选观测自动解释为确定缺陷。

## 比较组

同一比较组必须保持以下信息一致：

- benchmark ID 和 ST 程序 SHA-256；
- 目标、输入样本集合和 grammar 的 SHA-256；
- 仓库 commit、MatIEC commit 和输入生成工具版本；
- 实验持续时间、单次执行超时、PLC 周期数量和周期延时；
- 操作系统、架构、处理器和 CPU 数量形成的机器指纹。

允许变化的维度只有 strategy ID、replicate index 和与该 index 对应的固定 seed。跨机器或跨版本结果必须分组报告，不能直接合并。

## 重复规则

协议提供五个互不相同的固定 seed，并要求每个 benchmark/strategy 组合至少完成五次重复。replicate index 从 0 开始，并且必须与协议数组中同一位置的 seed 完全一致。

评价模式通过 AFL++ 的 `-s` 参数传入固定 seed。该参数在 AFL++ 源码帮助文本中定义为固定 RNG seed；项目输入转换器也使用 AFL++ 传入的实例 seed，因此两层随机状态均可由实验记录追踪。

## 指标

| 指标 | 范围/单位 | 含义 |
| --- | --- | --- |
| `valid_input_ratio` | `0..1` | 被目标接受的执行次数 ÷ 总尝试执行次数 |
| `path_coverage_delta` | edge 数量 | 最终覆盖 edge 数量 − 初始输入集合覆盖 edge 数量 |
| `plc_state_transition_count` | 非负整数 | 相邻执行步骤中不同 `(前状态, 后状态)` 对的数量 |
| `unique_observation_count` | 非负整数 | 按内容与行为摘要去重后的稳定观测数量 |
| `time_to_first_observation_seconds` | 非负秒数或 null | 首个稳定观测相对实验开始的时间；未出现时为 null |
| `replay_success_ratio` | `0..1` | 稳定回放确认次数 ÷ 回放总次数 |
| `replicate_variability` | 每指标的离散度 | 对匹配 seed 的重复结果计算样本标准差，并同时报告最小值和最大值 |

前六项是 trial 指标，最后一项只能在汇总阶段计算。比率必须同时保留分子和分母作为证据；计数与时间指标也必须引用来源文件或收集记录。

## 缺失数据

没有收集到指标不等于数值为零。`evaluation-result.json` 中未收集的指标必须使用：

```json
{
  "status": "pending",
  "value": null,
  "reason": "measurement has not been collected",
  "evidence": []
}
```

无法收集时使用 `unavailable` 和具体原因；只有 `complete` 状态允许非 null 数值，并且必须至少包含一个证据引用。

## 启动评价模式

五个评价变量必须同时设置：

```bash
EVALUATION_PROTOCOL=evaluation/protocol-v1.json \
EVALUATION_BENCHMARK_ID=example-state-machine \
EVALUATION_STRATEGY_ID=structured-input-v1 \
EVALUATION_REPLICATE_INDEX=0 \
EVALUATION_REPLICATE_SEED=104729 \
./scripts/plc-lab experiment
```

启动前会校验协议、index 与 seed。实验目录同时生成 `manifest.json` 和 `evaluation-result.json`；普通开发实验不设置这些变量时保持原有行为。

## 校验

```bash
./scripts/plc-lab evaluation validate-protocol
./scripts/plc-lab evaluation validate-result path/to/evaluation-result.json
./scripts/plc-lab evaluation template --help
```

后续基准集、策略对照和报告工具都应读取协议文件，不得在各自脚本中重复定义指标。
