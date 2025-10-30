# Readme

## 简介

本项目完成的是plc代码的模糊测试工作。

## 编译和使用方法

将matiec编译成可执行文件：

$ autoreconf -i
$ ./configure
$ make


## PLC到C++的运行脚本和输出脚本

1. build_plc_to_c.sh
这个脚本将plc代码编译成C代码。编译的过程中需要修改脚本，指定到底要编译哪个文件。

2. build_plcfiles.sh
实际运行的将plc代码编译成C代码的脚本。编译出来的C代码会放在./plclogic文件夹下

3. build_shared_library.sh
这个脚本将plc的自定义变异策略（放在文件夹./fuzz_config下面）编译成一个共享库。
主要使用了本文件夹下的CMakeLists.txt文件，和./fuzz_config文件夹下的CMakeLists.txt文件。

4. build.sh
使用方法：
./build.sh 不插桩的方法build放在./plclogic文件夹下的plc的C代码
./build.sh -f 插桩的方法来build放在./plclogic文件夹下的plc的C代码

5. run.sh
普通地运行一下生成的未插桩的可执行文件。

6. run_fuzz.sh
运行插桩过后的可执行文件。脚本已写好，链接共享库，使用自定义的变异策略。


## 使用方法

先分析plc代码，确定需要模糊测试的变量和函数。

python3 ./static_analyse/main.py 分析plc代码，生成配置文件。

先编译插桩代码

./build_shared_library.sh 编译共享库

./build.sh 普通编译

./buildfuzz.sh

./run.sh 运行未插桩的可执行文件

./runfuzz.sh 运行插桩过后的可执行文件



## 实际使用方法

1. 先修改./build_plc_to_c.sh脚本，指定要编译的plc文件。

2. 运行./build_plc_to_c.sh脚本，将plc代码编译成C代码。

3. 运行./build.sh脚本，编译未插桩的可执行文件，生成glueVars.cpp文件

4. python3 ./static_analyse/main.py 分析plc代码，生成配置文件。

5. 运行./build_shared_library.sh脚本，编译共享库。

6. 运行./buildfuzz.sh脚本，编译插桩过后的可执行文件。

7. 运行./run.sh脚本，运行未插桩的可执行文件。

8. 运行./runfuzz.sh脚本，运行插桩过后的可执行文件。


## 更新：
现在已经整合成了一个脚本。
运行./buildscript.sh脚本，即可完成编译流程
运行./runfuzz.sh脚本，即可运行插桩过后的可执行文件。



todo: 绑定到不同的核心上。后面的内容都没有经过测试。




todo：更新新的配置
非常好！您决定采用 ​​“单进程绑核”​​ 的方案来进行模糊测试，这是一个非常务实且高效的选择。下面我将为您详细阐述如何具体设置AFL++（目前最活跃的AFL分支）以及OpenPLC环境，以确保测试尽可能高效且干扰最小化。
一、核心配置思路
您的目标很明确：​​将OpenPLC运行时进程与AFL模糊测试进程物理隔离到不同的CPU核心上​​。这需要通过一系列系统级和工具级的配置来实现。
​​CPU拓扑规划​​：首先，您需要规划好CPU核心的用途。假设您有一个8核CPU（核心0-7）：
​​核心 0​​：专用于运行OpenPLC运行时进程，并尽可能进行系统级隔离。
​​核心 1​​：专用于运行单个AFL模糊测试进程。
​​核心 2-7​​：留给操作系统和其他进程使用，承担系统“噪声”。
​​系统级准备（System-Level Preparation）​​
这是减少内核干扰的关键一步，需要在运行测试前完成。
​​隔离核心（可选但推荐）​​：在Linux内核启动参数中，为核心0和核心1添加隔离。例如，在GRUB配置文件中添加 isolcpus=0,1参数。这会告诉内核的通用调度器，尽量不要在这两个核心上调度任何用户进程，除非显式地通过绑核启动。
​​中断屏蔽（高级操作）​​：您可以使用 irqbalance服务或手动编写脚本，将大部分硬件中断（如网络、磁盘）的重定向到非隔离核心（如核心2-7）。这可以为核心0和1创造一个更“安静”的环境。例如：
# 示例：将所有的可迁移的中断转移到CPU2上处理
echo 2 > /proc/irq/default_smp_affinity
for i in /proc/irq/*/smp_affinity; do echo 2 > $i 2>/dev/null; done
​​启动OpenPLC运行时（Start OpenPLC Runtime）​​
使用 taskset命令将OpenPLC进程启动并严格绑定到核心0，并确保其以最高实时优先级运行。
# 在OpenPLC项目目录中，使用nohup在后台启动，并绑定到核心0
taskset -c 0 nohup ./openplc_runtime &
taskset -c 0: 将后续启动的进程绑定到CPU核心0。
nohup: 让进程在后台持续运行，即使终端关闭也不退出。
&: 在后台运行。
OpenPLC进程内部的实时调度策略（SCHED_FIFO）通常在它的源代码的 main.cpp或相关初始化文件中已经设置，无需额外命令。
​​编译待测目标（Compile Target for Fuzzing）​​
AFL++需要通过编译时插桩来跟踪代码覆盖率。您需要重新编译OpenPLC的​​网络协议模块​​（例如Modbus处理库）。
# 1. 进入OpenPLC源代码目录
cd /path/to/OpenPLC_source

# 2. 使用afl-clang-fast（LLVM模式）重新编译，例如只编译Modbus部分
# 找到Modbus相关的编译规则，将g++替换为afl-clang-fast++
CC=afl-clang-fast CXX=afl-clang-fast++ ./configure
make -j$(nproc)

# 或者，如果项目使用CMake
CC=afl-clang-fast CXX=afl-clang-fast++ cmake .
make -j$(nproc)
这将生成一个被AFL插桩的 openplc_runtime二进制文件。
​​准备AFL测试用例（Prepare AFL Test Cases）​​
创建一个输入目录，放入一些有效的、能触发Modbus协议解析的种子文件。
mkdir afl_inputs
# 创建一些简单的Modbus TCP请求报文作为种子
# 例如，一个读取保持寄存器的请求，可以使用scapy、python或从Wireshark中导出
python3 -c "open('afl_inputs/read_hold_reg', 'wb').write(b'\x00\x01\x00\x00\x00\x06\x01\x03\x00\x00\x00\x01')"
​​启动AFL模糊测试（Launch AFL Fuzzing）​​
这是最关键的一步，使用 taskset将AFL进程绑定到核心1，并使用 AFL_NO_AFFINITY=1环境变量阻止AFL对其子进程进行额外的绑核调度。
# 设置环境变量，防止AFL内部调整CPU亲和性
export AFL_NO_AFFINITY=1

# 使用taskset启动afl-fuzz，绑定到核心1
taskset -c 1 afl-fuzz -i afl_inputs -o afl_outputs -M fuzzer01 -- ./openplc_runtime @@
taskset -c 1: 将 afl-fuzz主进程绑定到CPU核心1。
AFL_NO_AFFINITY=1: ​​至关重要​​！这告诉AFL不要对自己fork出的子进程进行任何CPU亲和性设置，让它们继承父进程的绑定（即核心1）。如果没有这个，AFL可能会把子进程调度到其他核心，破坏您的隔离计划。
-M fuzzer01: 给主Fuzzer一个名字。
-- ./openplc_routine @@: 指定待测程序，@@是AFL用来替换输入文件的占位符。
二、方案验证与监控
启动后，您需要验证配置是否生效。
​​验证CPU绑定​​：使用 htop或 top命令查看。
在 htop中，按 F2-> Columns -> 选中 PROCESSOR，即可看到每个进程运行在哪个核心上。确认 openplc_runtime只在核心0，afl-fuzz只在核心1。
​​监控系统负载​​：使用 mpstat -P ALL 1命令，每秒报告所有CPU核心的利用率。
您应该看到核心0和1的 %usr（用户态利用率）很高，而其他核心的 %sys（系统态利用率）可能会比较高，因为它们在处理中断和系统调用。这正是您所期望的——将干扰导向非关键核心。
​​监控OpenPLC状态​​：如果OpenPLC提供了Web界面或日志，观察其是否运行正常，扫描周期是否稳定（尽管可能有微秒级抖动）。
三、总结与注意事项
您最终采用的命令流程总结如下：
# 终端1：启动被测程序（OpenPLC）
taskset -c 0 nohup ./openplc_runtime &

# 终端2：启动模糊测试（AFL）
export AFL_NO_AFFINITY=1
taskset -c 1 afl-fuzz -i afl_inputs -o afl_outputs -M fuzzer01 -- ./openplc_runtime @@
​​重要注意事项​​：
​​内核干扰​​：请再次理解，此方案能​​极大减轻但无法完全消除​​干扰。内核活动（如定时器中断）仍会发生在所有核心上，这是无法避免的。
​​测试目标​​：此方案完美适用于测试OpenPLC的​​网络协议栈健壮性​​。如果您发现了一个崩溃，它极有可能是一个真实存在的、在恶劣网络环境下可能被触发的漏洞。
​​性能权衡​​：单实例Fuzzing的路径发现速度会比多实例慢，但换来了对系统更小的干扰，这对于您的测试场景是值得的。
通过以上精心配置，您已经搭建了一个非常理想的模糊测试环境，能够高效地挖掘OpenPLC在网络协议处理过程中可能存在的深层漏洞。祝您Fuzzing顺利，收获满满！