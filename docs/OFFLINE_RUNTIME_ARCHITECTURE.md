# 离线运行时架构

PLC Robustness Lab 的离线运行时按职责分层，同时保留 MatIEC 与 OpenPLC 所需的兼容接口。可执行入口 `src/main.cpp` 只调用 `offline_runtime::run`，运行参数和输出格式保持不变。

## 生命周期与依赖方向

`src/offline_runtime.cpp` 负责初始化、逐周期执行和有序关闭。它只通过以下窄接口使用具体策略：

- `RuntimeInputApplication`：解析版本化输入并按周期原子应用下一组值；
- `RuntimeCycleScheduler`：维护单调时钟截止时间与可选的墙钟节拍；
- `RuntimeStateObserver`：保存状态历史并计算最终输出变化候选；
- `RuntimeResultRecorder`：汇总周期耗时与唤醒延迟并发布运行结果；
- `runtime_support`：承载 OpenPLC 兼容的全局状态、回调和辅助函数。

`src/hardware_layer.cpp` 是继承自 OpenPLC 的离线适配边界。它保留既有硬件函数签名，但把输入推进与状态观测分别委托给上述模块。MatIEC 生成函数和全局变量表只在编排层、适配层及兼容层中出现。

## 通信兼容边界

保留的消息处理接口不启动在线服务，仅用于离线兼容检查：

- `src/modbus.cpp`：消息调度与公共响应辅助函数；
- `src/modbus_discrete.cpp`：线圈和离散量处理；
- `src/modbus_registers.cpp`：16、32、64 位寄存器处理；
- `src/runtime_buffer_map.cpp`：未被生成代码映射的后备存储；
- `include/modbus_runtime_internal.h`：仅供上述实现共享的常量与声明。

公开的 `processModbusMessage` 与 `mapUnusedIO` 签名保持兼容，代表性字节级响应由单元测试固定。

## 构建提示边界

Makefile 显式列出 `PROJECT_CPP_SRCS`、`GENERATED_C_SRCS` 和 `GENERATED_CPP_SRCS`。受维护源码使用 `PROJECT_WARNING_FLAGS`，第三方及生成源码使用独立的 `GENERATED_WARNING_FLAGS`；MatIEC 与继承头文件通过系统包含路径进入受维护源码编译。诊断、覆盖率及 AFL++ 所需的上游环境变量和 ABI 名称保持原样，并继续通过 `EXTRA_CXXFLAGS` 传给两类目标。

运行 `./scripts/check_runtime_modules.sh` 可检查模块大小、职责落点、源文件清单和编译规则。完整 Linux 验收还会构建普通、诊断、覆盖率和插桩目标并回放代表性输入。
