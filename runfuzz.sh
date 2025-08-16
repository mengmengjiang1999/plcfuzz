export AFL_DEBUG=1 
export AFL_QEMU_DEBUG_MAPS=1
export AFL_SKIP_CPUFREQ=1
export AFL_SKIP_BIN_CHECK=1
export AFL_MAP_SIZE=10000000
export AFL_AUTORESUME=1
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
afl-fuzz -Q -t 10000 -i ~/Project/fuzzbuild/plcfuzz/seeds -o ~/Project/fuzzbuild/plcfuzz/output -- ./openplc @@