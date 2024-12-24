
将matiec编译成可执行文件：

$ autoreconf -i
$ ./configure
$ make

如果这个过程需要插入模糊测试，那么第二句变成：

./configure CC=afl-clang-fast CXX=afl-clang-fast++


然后得到的./iec2c 二进制文件，就是可以将plc源代码编译成C代码的工具。


将plc源代码编译成C代码

./iec2c xxx.st


% todo：有需要修改的地方

现在要想顺利跑起来，缺了一个文件：beremiz.h这个文件。但是不知道这个文件是从哪里来的，现在只能先复制过来

使用AFL-Fuzz编译这段代码

CC=afl-clang-fast CXX=afl-clang-fast++ 
g++ -std=gnu++11 -I ./lib -c Config0.c -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w
g++ -std=gnu++11 -I ./lib -c Res0.c -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Generating glueVars..."
./glue_generator
echo "Compiling main program..."
g++ -std=gnu++11 *.cpp *.o -o openplc -I ./lib -pthread -fpermissive `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Compilation finished successfully!"


说明：glue_generator是用来生成glueVars的，如果没有glueVars.cpp这个文件，可以先运行一下./glue_generator。
这个文件也是OpenPLC中预先提供的，不需要自己写，而且也不需要进入fuzz变异流程


export AFL_DEBUG=1 AFL_QEMU_DEBUG_MAPS=1
export AFL_SKIP_CPUFREQ=1
export AFL_SKIP_BIN_CHECK=1
afl-fuzz -i ~/Project/fuzzbuild/plcfuzz/seeds -o ~/Project/fuzzbuild/plcfuzz/output -- ./openplc @@