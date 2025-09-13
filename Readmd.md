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