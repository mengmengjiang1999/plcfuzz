CXX := g++

# 目录和文件路径
BUILD_DIR     ?= build/runtime
PLCLOGIC_DIR  ?= plclogic
SRC_DIR       := src
TOOLS_DIR     := tools
TARGET        ?= openplc
GENERATED_CPP := $(SRC_DIR)/glueVars.cpp
LOCATED_VARS  := $(PLCLOGIC_DIR)/LOCATED_VARIABLES.h
GLUE_GENERATOR:= $(TOOLS_DIR)/glue_generator

# 源文件列表（显式列出C文件，通配符匹配CPP文件）
C_SRCS        := $(PLCLOGIC_DIR)/Config0.c $(PLCLOGIC_DIR)/Res0.c
CPP_SRCS      := $(wildcard $(SRC_DIR)/*.cpp)
# 过滤掉生成的glueVars.cpp以避免重复
CPP_SRCS      := $(filter-out $(GENERATED_CPP), $(CPP_SRCS))
ALL_CPP_SRCS  := $(CPP_SRCS) $(GENERATED_CPP)

# 对象文件生成规则：所有.o文件放在BUILD_DIR下
C_OBJS        := $(patsubst $(PLCLOGIC_DIR)/%.c, $(BUILD_DIR)/%.o, $(C_SRCS))
CPP_OBJS      := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(ALL_CPP_SRCS))
OBJS          := $(C_OBJS) $(CPP_OBJS)

# 编译和链接标志
CXXFLAGS      := -std=gnu++11 -I./lib -I$(PLCLOGIC_DIR) -I./include $(EXTRA_CXXFLAGS)
LDFLAGS       := -pthread -fpermissive
LDLIBS        := $(shell pkg-config --cflags --libs libmodbus) -lasiodnp3 -lasiopal -lopendnp3 -lopenpal
ifdef ETHERCAT_INC
    CXXFLAGS  += $(ETHERCAT_INC)
    LDFLAGS   += $(ETHERCAT_INC)
endif

# 默认目标
all: $(TARGET)

# 链接可执行文件：依赖所有对象文件
$(TARGET): $(OBJS) | $(BUILD_DIR)
	@echo "Compiling main program..."
	$(CXX) $(OBJS) -o $@ $(LDFLAGS) $(LDLIBS)
	@echo "Compilation finished successfully!"

# 编译C源文件为对象文件（使用C++编译器）
$(BUILD_DIR)/%.o: $(PLCLOGIC_DIR)/%.c | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 编译CPP源文件为对象文件
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 生成glueVars.cpp的规则
$(GENERATED_CPP): $(LOCATED_VARS) | $(GLUE_GENERATOR)
	@echo "Generating glueVars..."
	$(GLUE_GENERATOR) $< $@

# 确保glue_generator工具存在（简单依赖检查）
$(GLUE_GENERATOR):
	@echo "Error: glue_generator tool not found at $(GLUE_GENERATOR)"
	@false

# 创建构建目录
$(BUILD_DIR):
	mkdir -p $@

# 清理生成的文件
clean:
	rm -rf build openplc openplc_fuzz

.PHONY: all clean
