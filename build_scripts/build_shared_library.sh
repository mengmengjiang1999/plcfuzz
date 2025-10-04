# g++ -shared -fPIC -o ./fuzz_config/plc_mutator.so ./fuzz_config/plc_mutator.cpp


# 1. 创建并进入构建目录
mkdir -p build && cd build

rm -rf *

# 2. 运行 CMake 配置项目
cmake ..

# 3. 编译项目
make -j$(nproc)

# 4. 编译完成后，共享库将生成在 ../lib/plc_mutator.so