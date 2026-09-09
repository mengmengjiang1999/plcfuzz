# Linux 容器验收记录

## 最近一次结果

2026-09-09 在 Docker Desktop 的 `linux/amd64` 环境完成全流程验收，结果为 **passed**。

| 项目 | 记录值 |
| --- | --- |
| 基础镜像 | `public.ecr.aws/ubuntu/ubuntu:22.04@sha256:23bda685bd84a4d3b9caf2086a4c35f368bb7acd57ef38090b7a45ac92216ccf` |
| 基础镜像 ID | `sha256:23bda685bd84a4d3b9caf2086a4c35f368bb7acd57ef38090b7a45ac92216ccf` |
| 最终本地镜像内容摘要 | `sha256:f1fa4266c3f97985340085040775cd1363e08baf50f96eb3cc53d9e5220e593e` |
| MatIEC gitlink | `cc7cb0250fc3199e726fb43260c180727fd4d128` |
| 编译器 | GCC/G++ 11.4.0 |
| MatIEC | 0.1 |
| AFL++ | 5.03c |
| CMake | 3.22.1 |
| Python | 3.10.12 |

该最终摘要是 Docker 本地镜像内容 ID，不是已发布镜像仓库的 manifest digest。本次构建发生在 change 提交前，因此内部报告的 `source_revision` 是前一主题提交 `f772906895d0ce574e0a628f60e2021535a0226f`；实际受验源码与归档规范由上表的最终镜像内容摘要绑定。

## 验收范围

容器构建层依次完成：

1. 保留材料、源码布局、学术用语、版权元数据和统一入口检查；
2. 从固定 submodule 构建 MatIEC，并通过其 14 组测试套件；
3. 运行 PLC Robustness Lab 单元测试，核对全部 55 个 ST 文件的预期编译结果和 31 个 LD 文件的清单；
4. 构建普通运行目标、结构化变量映射、自定义输入组件、ASan/UBSan 诊断目标和 AFL++ 插桩目标；
5. 使用保留的 `seed_0` 分别运行普通和插桩目标，并核对二者都以预期的输出变化候选信号结束；
6. 在镜像内写入命令、平台、工具和 Ubuntu 软件包版本，再由主机补充镜像标识与完成时间。

机器可读结果位于被 Git 忽略的 `output/linux-container-acceptance/manifest.json`。镜像内同时保留 `/opt/plc-lab-acceptance/report.json`。

## 重新验收

先初始化 submodule，并确保 Docker 可用：

```sh
git submodule update --init --recursive
./scripts/build_linux_container.sh
```

命令固定请求 `linux/amd64`。可以通过 `PLC_LAB_CONTAINER_TAG` 或 `PLC_LAB_CONTAINER_REPORT_DIR` 修改本地镜像标签和报告输出目录；修改平台变量时应作为一次新的独立验收记录处理。

Ubuntu 软件源未按单个包的下载摘要封存。组合报告会记录实际安装版本，以便后续运行识别环境差异。
