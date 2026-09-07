# 可复现环境

原始实验已确认在 Linux 环境下运行。仓库内 ELF 二进制的编译器标记进一步显示 Ubuntu 22.04：`tools/iec2c` 包含 GCC 11.4/12.3 标记，`openplc_fuzz` 包含 `GCC 12.3.0-1ubuntu1~22.04.2` 标记。历史实验数据还记录了 AFL++ 4.10c。因此，复现基线采用 x86-64 Ubuntu 22.04，而不是在 macOS 上直接运行。原实验机的内核版本仍待从实验记录中补全。

## 固定的基线

| 项目 | 版本或不可变标识 |
| --- | --- |
| 容器基础系统 | Ubuntu 22.04，从 Amazon Public ECR 拉取并固定 digest `sha256:23bda685...92216ccf` |
| AFL++ | `v4.10c`（与 `findings/*/fuzzer_stats` 一致） |
| OpenPLC v3 上游源码 | `091524e1d80120cbe6b2c130822e91369f12eccd`（2024-12-11） |
| C/C++ 标准 | GCC/Clang，项目以 `-std=gnu++11` 编译 |
| Python | Python 3（静态分析脚本仅使用标准库） |

OpenPLC 上游树用于构建本项目所链接的 OpenDNP3 和 libmodbus。选定的上游提交早于本仓库初始提交，且其 `webserver/core/dnp3.cpp` 与本仓库初始版本的文件 SHA-256 一致（`f7a35fb49045428b6138226bbd6558ce571f46522a94a51873f49cd51621f384`）。源码树保留在镜像的 `/opt/upstream` 中，便于审计与查看许可文本。

由于当前网络无法访问 Docker Hub 和 Ubuntu 官方 APT 站点，基础镜像通过 Amazon Public ECR 获取，APT 使用阿里云 Ubuntu 镜像。包内容仍是 Ubuntu 22.04 amd64。

## 构建容器

在仓库根目录执行：

```sh
docker build --platform linux/amd64 -f Dockerfile.repro -t plcfuzz:repro .
docker run --rm -it --platform linux/amd64 -v "$PWD:/workspace/plcfuzz" plcfuzz:repro
```

Apple Silicon 主机也应显式使用 `linux/amd64`，因为仓库保留的 `tools/iec2c`、`tools/iec2iec` 和 `tools/glue_generator` 都是 x86-64 二进制。

## 复现编译流程

进入容器后：

```sh
./scripts/verify_preserved_artifacts.sh
./buildscript.sh
```

`buildscript.sh` 依次执行 PLC 源码转 C、普通目标编译、静态分析、自定义变异器编译和 AFL++ 插桩目标编译。默认输入是 `testcases/race_test_success.st`。

如果只想验证 PLC 到 C 的转换：

```sh
./build_scripts/build_plcfiles.sh ./testcases/race_test_success.st
test -s ./plclogic/Config0.c
test -s ./plclogic/Res0.c
```

## 复现模糊测试

运行前需准备 `seeds/` 目录。当前仓库保留的原始种子位于 `seeds copy/`，为避免改动历史实验材料，请复制而不是重命名：

```sh
mkdir -p seeds
cp -a "seeds copy/." seeds/
./runfuzz.sh
```

`runfuzz.sh` 默认运行 3600 秒，超时为 10000 ms，输出到 `findings/`。为保护仓库中的原始结果，建议先备份输出目录，或在一个独立工作树中运行。

## 已知限制

- Dockerfile 固定了 Ubuntu 22.04 基础镜像 digest 和上游 Git 版本，但 Ubuntu APT 软件包仍未按包哈希封存；若用于论文归档，还应记录成功构建后的最终镜像 digest。
- 历史脚本中有 `/home/mmj/Project/fuzzbuild/plcfuzz` 绝对路径的记录；这些路径是实验元数据，不应用作新环境的路径。
- `findings/`、`findings copy/` 与仓库内预编译工具是复现材料，不应在“清理仓库”时删除。

## 记录一次实验

论文或附录至少应记录：仓库 commit、镜像 digest、CPU 型号/核数、内存、内核版本、AFL++ `fuzzer_stats` 和实际命令行。可用以下命令采集基本信息：

```sh
git rev-parse HEAD
afl-fuzz --version
uname -a
lscpu
free -h
sha256sum tools/iec2c tools/iec2iec tools/glue_generator
```
