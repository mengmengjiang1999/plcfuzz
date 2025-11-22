export AFL_DEBUG=1 
# export AFL_QEMU_DEBUG_MAPS=1
export AFL_SKIP_CPUFREQ=1
# export AFL_SKIP_BIN_CHECK=1
export AFL_MAP_SIZE=10000000
# export AFL_AUTORESUME=1
# export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
LIB_PATH=$(realpath ./build/libplc_mutator.so)
export AFL_CUSTOM_MUTATOR_LIBRARY=$LIB_PATH

# 创建命名管道（避免缓冲问题）
mkfifo /tmp/program_output
rm program_output.log
cat /tmp/program_output > program_output.log &
export AFL_AUTORESUME=1
afl-fuzz -V 3600 -t 10000 -i seeds/ -o findings/ -g ~/Project/fuzzbuild/plcfuzz/fuzz_config/plc.grammar -- ./openplc_fuzz  @@

