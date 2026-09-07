# 第三方代码与许可说明

本文件是对仓库内可识别第三方材料的盘点，不替代各上游项目的完整许可文本，也不构成法律意见。保留源文件中的版权和许可头是必要的。

## 仓库内包含的第三方材料

| 组件 | 仓库中的位置 | 识别依据 | 许可 |
| --- | --- | --- | --- |
| OpenPLC Software Stack | `src/` 中多个文件、`include/ladder.h`、`include/enipStruct.h`、`tools/glue_generator` | 文件头标明 Thiago Alves/OpenPLC；`glue_generator` 来自 OpenPLC 工具链 | GPL-3.0-or-later |
| MatIEC | `tools/iec2c`、`tools/iec2iec`、`tmp.yy` | 二进制/源文件标识为 MatIEC IEC 61131-3 compiler | GPL-3.0-or-later |
| MatIEC/Beremiz IEC 运行库 | `lib/iec_std_functions.h`、`lib/iec_std_lib.h` | 文件头标明 Edouard Tisserant 和 Mario de Sousa | LGPL-2.0-or-later |
| MatIEC/Beremiz IEC 类型定义 | `lib/iec_types_all.h` | 文件头标明 Edouard Tisserant 和 Laurent Bessard | LGPL-3.0-or-later |
| LDmicro 衍生部分 | `src/hardware_layer.cpp`、`src/modbus.cpp`、`include/ladder.h` | OpenPLC 文件头写明 “Based on the LDmicro software by Jonathan Westhues” | 作为 OpenPLC 文件依 GPL-3.0-or-later 分发；仍应保留原始归属 |

上游位置：

- OpenPLC v3: <https://github.com/thiagoralves/OpenPLC_v3>
- MatIEC: <https://github.com/beremiz/matiec>

## 构建和运行时依赖

| 组件 | 用途 | 许可 |
| --- | --- | --- |
| AFL++ 4.10c | 插桩编译与模糊测试 | Apache-2.0 |
| OpenDNP3 | DNP3 协议实现，由目标程序动态链接 | Apache-2.0 |
| libmodbus | Modbus 协议库，由目标程序动态链接 | LGPL-2.1-or-later |

上游位置：

- AFL++: <https://github.com/AFLplusplus/AFLplusplus/tree/v4.10c>
- OpenDNP3/libmodbus 在本复现环境中取自固定版本的 OpenPLC v3 上游树，见 `Dockerfile.repro`。

## 预编译二进制

这些文件是研究复现的必要材料，不应删除。当前文件的 SHA-256 为：

```text
2008c1c9740ccc38f4ceb6f98b1a82d095743334ff70876e97d9bb0bf1d2e54e  tools/iec2c
9598c16d5b75f5dac5880f53d3f6372d6b5a5bd168cdb883531b2a254717653a  tools/iec2iec
57b43f8b211f5745288175001c4f6b44f8012966eaac06593601b772683bf062  tools/glue_generator
3d922cfd0675136be169327a630c73cbd4485923e84ea65b38e2b76d07d29f4f  openplc_fuzz
```

`tools/iec2c` 和 `tools/iec2iec` 是 GPL 覆盖的目标代码。对外分发时，需同时满足 GPL 对完整许可文本、版权通知和对应源码的要求。`Dockerfile.repro` 会保留上游源码树，但正式发布前仍应确认这些二进制对应的精确 MatIEC commit。仅凭现有二进制无法可靠反推该 commit。

## 项目自身许可状态

当前仓库没有顶层 `LICENSE` 文件，因此不能从仓库内确定作者原创代码、脚本、文档和实验数据的授权条款。第三方说明不会自动为这些原创材料授权。

在对外发布前，仓库所有者应：

1. 根据与 GPL 组件的组合方式，为原创代码选择兼容许可证，并添加完整的顶层 `LICENSE`。
2. 核对 `testcases/LD-test/` 等收集的测试用例的出处和可再分发权；现有仓库证据不足以确定其许可。
3. 将对应版本的 GPL-3.0、LGPL-2.0、LGPL-2.1、LGPL-3.0 和 Apache-2.0 完整文本放入 `LICENSES/` 目录。
4. 保留所有原始文件头、作者归属和修改记录。
