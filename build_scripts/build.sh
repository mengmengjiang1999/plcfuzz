CC=gcc CXX=g++

if [ "$1" = "-f" ]; then
    CC=afl-clang-fast CXX=afl-clang-fast++
fi

rm -rf ./build_plclogic
mkdir ./build_plclogic
g++ -std=gnu++11 -I ./lib -c ./plclogic/Config0.c  -o ./build_plclogic/Config0.o -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w 
g++ -std=gnu++11 -I ./lib -c ./plclogic/Res0.c  -o ./build_plclogic/Res0.o  -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Generating glueVars..."
./tools/glue_generator ./plclogic/LOCATED_VARIABLES.h ./src/glueVars.cpp
echo "Compiling main program..."
g++ -std=gnu++11  ./src/*.cpp ./build_plclogic/*.o -o openplc -I ./lib -I ./plclogic/ -I ./include/ -pthread -fpermissive `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Compilation finished successfully!"