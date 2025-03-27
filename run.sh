CC=gcc CXX=g++
g++ -std=gnu++11 -I ./lib -c ./buildfiles/Config0.c -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w
g++ -std=gnu++11 -I ./lib -c ./buildfiles/Res0.c -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Generating glueVars..."
./glue_generator ./buildfiles/LOCATED_VARIABLES.h ./glueVars.cpp
echo "Compiling main program..."
g++ -std=gnu++11  *.cpp *.o -o openplc -I ./lib -I ./buildfiles/ -pthread -fpermissive `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w $ETHERCAT_INC
echo "Compilation finished successfully!"

./openplc < input.txt  > output.txt