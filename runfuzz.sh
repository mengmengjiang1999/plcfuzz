export AFL_DEBUG=1 
export AFL_QEMU_DEBUG_MAPS=1
export AFL_SKIP_CPUFREQ=1
export AFL_SKIP_BIN_CHECK=1
export AFL_MAP_SIZE=10000000
export AFL_AUTORESUME=1
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
LIB_PATH=$(realpath ./build/libplc_mutator.so)
AFL_CUSTOM_MUTATOR_LIBRARY=$LIB_PATH afl-fuzz -Q -t 10000 -i ~/Project/fuzzbuild/plcfuzz/seeds -o ~/Project/fuzzbuild/plcfuzz/output -g ~/Project/fuzzbuild/plcfuzz/fuzz_config/plc.grammar -- ./openplc @@

# # 设置环境变量
# export AFL_CUSTOM_MUTATOR_LIBRARY=./plc_mutator.py
# export AFL_CUSTOM_MUTATOR_ONLY=1
# export AFL_GRAMMAR_FILE=./plc.grammar

# # 运行模糊测试
# afl-fuzz -i in -o out -x plc.dict -g plc.grammar ./plc_program