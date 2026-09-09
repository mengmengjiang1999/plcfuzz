# 项目代码覆盖率

项目覆盖率用于判断现有测试实际执行了哪些受维护代码，不单独代表实现质量或研究结论。权威采集环境是 Linux CI 的 Ubuntu 22.04；普通构建和测试不要求安装覆盖工具。

## 范围边界

[`coverage/scope-v1.json`](../coverage/scope-v1.json) 是版本化白名单：

- C++ 包含项目维护的运行时入口、输入应用、变量地址、观测历史、通信兼容实现和输入转换组件；
- Python 包含实验清单、评价协议、策略比较、自动报告、样本整理、基准校验和变量映射工具；
- `third_party/`、`plclogic/`、`src/glueVars.cpp`、`lib/`、测试源码、归档材料和构建输出明确排除。

完整运行时构建仍需 MatIEC 生成文件，但报告只提取白名单路径。新增源文件不会自动改变统计口径，必须先评审并更新 scope 版本或内容摘要。

## 采集与验证

Linux 环境需要 `g++`、`lcov`、`genhtml` 和 Python Coverage.py：

```bash
./scripts/plc-lab coverage generate
./scripts/plc-lab coverage validate output/coverage/summary.json
```

生成过程使用隔离构建目录，执行 C++ 单元测试、Python 工具测试、结构化变量映射命令，并以无输出变化的 `state_test.st` 程序和版本化回放输入运行正常运行时。入口还会核对缺少参数和格式无效输入的明确失败状态。

输出包括：

- `cpp.info` 与 `cpp-html/`：过滤后的 C++ LCOV 数据和静态页面；
- `python.json`、`python.xml` 与 `python-html/`：Python 机器可读和静态页面；
- `summary.json`：两种语言分别记录文件、有效行、执行行、百分比、基线差值、排除项、集成检查和产物清单。

CI 会验证 `summary.json` 并上传名为 `project-code-coverage` 的完整目录，不需要仓库写权限。

## 基线策略

[`coverage/baseline-v1.json`](../coverage/baseline-v1.json) 保存本 change 完成前的首次完整采集值与 scope 摘要。当前 `enforcement` 是 `report-only`：低于基线会记录负差值，但不会只因比例下降而阻断构建。这样可以先积累不同 CI 运行的稳定数据，再通过独立 OpenSpec change 设置有依据的最低门槛。

提高门槛时应分别评估 C++ 和 Python，并优先补足运行时入口、输入应用与变量映射的未执行分支；不应通过移除低覆盖文件或加入生成代码来改变比例。
