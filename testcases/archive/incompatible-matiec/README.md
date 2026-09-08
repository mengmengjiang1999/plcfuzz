# Archived MatIEC-incompatible cases

这里保存使用当前固定版本 MatIEC（`cc7cb025`）进行兼容性扫描时不能通过编译的历史 ST 文件。它们可能使用旧版编译器扩展、非标准声明形式，或原本就是用于实验的非合法输入。

归档不改写这些案例的语法和程序逻辑。它们不属于 `testcases/matiec/` 合法用例套件，也不会被默认批量构建脚本选中。

| 原路径 | 归档路径 |
| --- | --- |
| `testcases/ST-test/c_demo.st` | `ST-test/c_demo.st` |
| `testcases/auto_race/auto5.st` … `auto12.st` | `auto_race/` |
| `testcases/ctc_osr.st` | `ctc_osr.st` |
| `testcases/hello_ld_convert.st` | `hello_ld_convert.st` |
| `testcases/race_bug_tests/auto2_test.st` | `race_bug_tests/auto2_test.st` |
| `testcases/test.st` | `test.st` |

若后续需要迁移某个案例，应复制到活动语料目录、注明目标 MatIEC profile，并把语法迁移和行为等价性验证放在独立提交中；不要直接改写本目录的历史快照。
