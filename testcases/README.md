# 测试用例清单

`manifest.tsv` 是 `testcases/` 下 ST 与 LD 测试文件的机器可读目录。当前版本覆盖 55 个 ST 文件和 31 个 LD 文件，共 86 条记录。

## 字段

| 字段 | 含义 |
| --- | --- |
| `path` | 当前 Git 跟踪路径 |
| `original_path` | 归档前路径；未移动文件与 `path` 相同 |
| `language` | `st` 或 `ld` |
| `collection` | 活动运行样例、代表性 benchmark、MatIEC 兼容用例、归档参考或 LD 参考集合 |
| `profile` | MatIEC profile；LD 使用 `not-applicable` |
| `expected` | 编译器预期结果；LD 使用 `not-checked` |
| `origin` | `project-authored`、`ldmicro` 或 `ldmicro-derived` |
| `license` | 已核对的 SPDX 标识 |
| `purpose` | 该文件在当前仓库中的研究用途 |

全部条目都已关联到 [`provenance.tsv`](provenance.tsv) 的来源证据。31 个 LD 文件逐项映射到固定 LDmicro commit 的信息见 [`LD-test/SOURCE.tsv`](LD-test/SOURCE.tsv)；可读说明见 [`LD-test/SOURCE.md`](LD-test/SOURCE.md)。其中 13 个文件在统一换行后与固定上游版本一致，18 个文件保留本地修改，清单不会把这些修改版本表示为未改动的上游副本。

两个归档 ST 文件 `ctc_osr.st` 和 `hello_ld_convert.st` 是 LDmicro 示例的本地转换版本，使用 `ldmicro-derived`；其他 ST 文件由本项目作者提交或在项目内生成。第三方材料按 `GPL-3.0-or-later` 分发，必须保留顶层 GPLv3 完整文本、来源映射、修改状态和上游归属。

## 验证

快速检查 manifest 结构、字段值、Git 文件覆盖范围、来源证据连接、外部文件映射和本地摘要：

```bash
python3 scripts/check_testcase_manifest.py
```

使用固定 MatIEC 核对全部 55 个 ST 条目的预期结果：

```bash
python3 scripts/check_testcase_manifest.py --verify-compiler
```

`scripts/validate_testcases.sh` 会先执行快速检查与 15 个基准用例的双重确定性编译，再编译 `testcases/matiec/` 下的 8 个重点兼容用例。LD 文件不是 MatIEC 输入，因此只登记、不在该命令中编译。基准结构和使用方式见 [`docs/BENCHMARK_SUITE.md`](../docs/BENCHMARK_SUITE.md)。
