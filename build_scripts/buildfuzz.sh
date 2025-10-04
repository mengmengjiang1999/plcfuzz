#!/bin/bash

CC=afl-clang-fast CXX=afl-clang-fast++

rm -rf ./build_plclogic
mkdir ./build_plclogic
$CXX -O0 -g -std=gnu++11 -I ./lib -c ./plclogic/Config0.c  -o ./build/Config0.o -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w -Wno-c++11-narrowing 
$CXX -O0 -g -std=gnu++11 -I ./lib -c ./plclogic/Res0.c  -o ./build/Res0.o  -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w -Wno-c++11-narrowing $ETHERCAT_INC
echo "Generating glueVars..."
./tools/glue_generator ./plclogic/LOCATED_VARIABLES.h ./src/glueVars.cpp
echo "Compiling main program..."
$CXX -O0 -g -std=gnu++11  ./src/*.cpp ./build/*.o -o openplc_fuzz -I ./lib -I ./plclogic/ -I ./include/ -pthread -fpermissive  `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w -Wno-c++11-narrowing $ETHERCAT_INC 
echo "Compilation finished successfully!"