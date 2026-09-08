# 测试用例清单

`manifest.tsv` 是 `testcases/` 下 ST 与 LD 测试文件的机器可读目录。当前版本覆盖 40 个 ST 文件和 31 个 LD 文件，共 71 条记录。

## 字段

| 字段 | 含义 |
| --- | --- |
| `path` | 当前 Git 跟踪路径 |
| `original_path` | 归档前路径；未移动文件与 `path` 相同 |
| `language` | `st` 或 `ld` |
| `collection` | 活动运行样例、MatIEC 兼容用例、归档参考或 LD 参考集合 |
| `profile` | MatIEC profile；LD 使用 `not-applicable` |
| `expected` | 编译器预期结果；LD 使用 `not-checked` |
| `origin` | 已确认的项目原创状态或 `repository-history` |
| `license` | 已确认的 SPDX 标识或 `to-review` |
| `purpose` | 该文件在当前仓库中的研究用途 |

`repository-history` 只说明文件存在于项目历史中，并不推断其最初来源；`to-review` 表示需要在后续来源与许可核对主题中补充证据。

## 验证

快速检查 manifest 结构、字段值和 Git 文件覆盖范围：

```bash
python3 scripts/check_testcase_manifest.py
```

使用固定 MatIEC 核对全部 40 个 ST 条目的预期结果：

```bash
python3 scripts/check_testcase_manifest.py --verify-compiler
```

`scripts/validate_testcases.sh` 会先执行快速检查，再编译 `testcases/matiec/` 下的 8 个重点兼容用例。LD 文件不是 MatIEC 输入，因此只登记、不在该命令中编译。
