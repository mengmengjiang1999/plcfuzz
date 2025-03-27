CC=afl-clang-fast CXX=afl-clang-fast++ 
g++ -std=gnu++11 -I ./lib -c Config0.c -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w
g++ -std=gnu++11 -I ./lib -c Res0.c -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Generating glueVars..."
./glue_generator
echo "Compiling main program..."
g++ -std=gnu++11 *.cpp *.o -o openplc -I ./lib -pthread -fpermissive `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Compilation finished successfully!"

export AFL_DEBUG=1 
exportAFL_QEMU_DEBUG_MAPS=1
export AFL_SKIP_CPUFREQ=1
export AFL_SKIP_BIN_CHECK=1
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_MAP_SIZE=10000000
afl-fuzz -Q -t 5000 -i ~/Project/fuzzbuild/plcfuzz/seeds -o ~/Project/fuzzbuild/plcfuzz/output -- ./openplc @@