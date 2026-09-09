# 第三方代码与许可说明

本文件盘点仓库内可识别的第三方材料，不替代上游完整许可文本，也不构成法律意见。分发时应保留源文件中的版权和许可头。

## 仓库内材料

| 组件 | 仓库中的位置 | 许可 |
| --- | --- | --- |
| MatIEC 当前源码 | `third_party/matiec/` git submodule | GPL-3.0-or-later；以 submodule 内许可文件为准 |
| MatIEC 历史产物 | `artifacts/legacy/matiec/iec2c`、`iec2iec`、`tmp.yy` | GPL-3.0-or-later |
| OpenPLC Software Stack | `src/` 中多个文件、`include/ladder.h`、`include/enipStruct.h`、`tools/glue_generator` | GPL-3.0-or-later |
| MatIEC/Beremiz IEC 运行库 | `lib/iec_std_functions.h`、`lib/iec_std_lib.h` | LGPL-2.0-or-later |
| MatIEC/Beremiz IEC 类型定义 | `lib/iec_types_all.h` | LGPL-3.0-or-later |
| LDmicro 衍生部分 | `src/hardware_layer.cpp`、`src/modbus.cpp`、`include/ladder.h` | 随 OpenPLC 文件按 GPL-3.0-or-later 分发；仍应保留原始归属 |

上游位置：

- 当前 MatIEC fork：<https://github.com/mengmengjiang1999/matiec>
- MatIEC 原上游：<https://github.com/beremiz/matiec>
- OpenPLC v3：<https://github.com/thiagoralves/OpenPLC_v3>

## 构建和运行时依赖

| 组件 | 用途 | 许可 |
| --- | --- | --- |
| AFL++ 5.03c | 插桩编译与自动化测试 | Apache-2.0 |
| OpenDNP3 | DNP3 协议实现，由目标程序动态链接 | Apache-2.0 |
| libmodbus | Modbus 协议库，由目标程序动态链接 | LGPL-2.1-or-later |

AFL++ 来源为 <https://github.com/AFLplusplus/AFLplusplus/tree/v5.03c>。OpenDNP3 和 libmodbus 在复现镜像中取自固定版本的 OpenPLC v3 上游树，详见 `Dockerfile.repro`。

## 保留的预编译二进制

这些文件用于研究复现，不是当前默认工具链。当前 SHA-256 为：

```text
2008c1c9740ccc38f4ceb6f98b1a82d095743334ff70876e97d9bb0bf1d2e54e  artifacts/legacy/matiec/iec2c
9598c16d5b75f5dac5880f53d3f6372d6b5a5bd168cdb883531b2a254717653a  artifacts/legacy/matiec/iec2iec
57b43f8b211f5745288175001c4f6b44f8012966eaac06593601b772683bf062  tools/glue_generator
3d922cfd0675136be169327a630c73cbd4485923e84ea65b38e2b76d07d29f4f  artifacts/legacy/openplc_fuzz
```

MatIEC 历史二进制是 GPL 覆盖的目标代码。对外分发时需要满足 GPL 对完整许可文本、版权通知和对应源码的要求；当前尚不能从二进制可靠确定它们对应的精确源码 commit。当前可构建的 submodule 不能自动证明它就是这些旧二进制的对应源码。

## 项目许可状态

仓库顶层已包含 GNU GPL version 3 的完整 `LICENSE` 文本。原创文件通过 `REUSE.toml` 以 `GPL-3.0-only` 标识，具体覆盖边界见 `docs/LICENSE_METADATA.md`。第三方组件继续受各自许可证约束；顶层许可证和原创文件聚合标注也不能替代对收集测试用例和实验数据来源的核查。

正式公开发布前应：

1. 核对 `testcases/LD-test/` 等收集用例和实验数据的出处及再分发权。
2. 按核对结果补齐实际随仓库分发材料所需的第三方许可证文本。
3. 保留所有原始文件头、作者归属、submodule commit 和修改记录。
