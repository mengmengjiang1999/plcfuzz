CC=gcc CXX=g++
rm -rf ./build
mkdir ./build
g++ -std=gnu++11 -I ./lib -c ./plclogic/Config0.c  -o ./build/Config0.o -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w 
g++ -std=gnu++11 -I ./lib -c ./plclogic/Res0.c  -o ./build/Res0.o  -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Generating glueVars..."
./tools/glue_generator ./plclogic/LOCATED_VARIABLES.h ./src/glueVars.cpp
echo "Compiling main program..."
g++ -std=gnu++11  ./src/*.cpp ./build/*.o -o openplc -I ./lib -I ./plclogic/ -I ./include/ -pthread -fpermissive `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Compilation finished successfully!"

./openplc < input.txt  > output.txt