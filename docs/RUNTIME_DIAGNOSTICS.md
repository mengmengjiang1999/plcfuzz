# 运行诊断与非正常终止样本整理

本流程用于隔离环境中的学术软件质量实验。它不连接生产 PLC、现场设备或外部服务，也不会把候选样本自动判定为已确认缺陷。

## 构建 ASan/UBSan 目标

同时构建普通运行时和自定义输入组件：

```bash
./scripts/plc-lab diagnostics all
```

也可以只构建一个目标：

```bash
./scripts/plc-lab diagnostics runtime
./scripts/plc-lab diagnostics transformer
```

输出与普通构建相互隔离：

- `build/diagnostics/runtime/openplc_diagnostic`
- `build/diagnostics/input-transformer/` 下的平台共享库

两个构建都启用 AddressSanitizer、UndefinedBehaviorSanitizer、调试信息和 frame pointer。诊断目标用于复现和定位，不替代普通运行目标。

## 整理本地样本

对一个只包含候选输入的目录运行：

```bash
python3 scripts/organize_abnormal_samples.py \
  --input-dir /path/to/candidate-samples \
  --output-dir /path/to/organized-run \
  --target build/diagnostics/runtime/openplc_diagnostic \
  --seed recorded-seed
```

整理器依次执行：

1. 按 SHA-256 对完全相同的输入去重；
2. 默认运行三次，只保留每次都以同一信号结束的样本；
3. 在保持同一信号的前提下，确定性删除不必要的连续字节区间；
4. 再次执行稳定性复核；
5. 保存最小化样本、标准错误/标准输出诊断和 JSON 元数据。

普通非零退出（例如输入格式被拒绝）不会被收录。默认单次超时为 10 秒，最小化最多评估 500 次；可分别用 `--timeout`、`--repeats` 和 `--max-minimize-evaluations` 调整。

输出目录必须不存在或为空，整理器不会覆盖已有记录，也不会修改源样本。顶层 `manifest.json` 记录：

- 仓库 commit 与 MatIEC commit；
- 目标路径和 SHA-256；
- 实际命令模板；
- seed、重复次数、超时和最小化上限；
- ASan/UBSan 与 PLC 运行时相关环境变量；
- 扫描、去重和保留数量；
- 每个样本的原始/最小化摘要、信号和诊断文件。

额外环境变量可重复使用 `--record-env NAME` 纳入 manifest。若目标来自其他 MatIEC 构建，可用 `--compiler-commit COMMIT` 明确覆盖自动读取的 gitlink。
