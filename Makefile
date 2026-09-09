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

# Active source manifest. Add new translation units deliberately; archived or
# experimental files are never selected by directory wildcard.
GENERATED_C_SRCS := $(PLCLOGIC_DIR)/Config0.c $(PLCLOGIC_DIR)/Res0.c
PROJECT_CPP_SRCS := \
	$(SRC_DIR)/buffer_history.cpp \
	$(SRC_DIR)/communication_compat.cpp \
	$(SRC_DIR)/hardware_layer.cpp \
	$(SRC_DIR)/main.cpp \
	$(SRC_DIR)/modbus.cpp \
	$(SRC_DIR)/modbus_discrete.cpp \
	$(SRC_DIR)/modbus_registers.cpp \
	$(SRC_DIR)/offline_runtime.cpp \
	$(SRC_DIR)/plc_input_simulator.cpp \
	$(SRC_DIR)/runtime_buffer_map.cpp \
	$(SRC_DIR)/runtime_cycle_scheduler.cpp \
	$(SRC_DIR)/runtime_globals.cpp \
	$(SRC_DIR)/runtime_input_application.cpp \
	$(SRC_DIR)/runtime_result_recorder.cpp \
	$(SRC_DIR)/runtime_state_observer.cpp \
	$(SRC_DIR)/runtime_support.cpp
GENERATED_CPP_SRCS := $(GENERATED_CPP)

# 对象文件生成规则：所有.o文件放在BUILD_DIR下
GENERATED_C_OBJS := $(patsubst $(PLCLOGIC_DIR)/%.c, $(BUILD_DIR)/%.o, $(GENERATED_C_SRCS))
PROJECT_CPP_OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(PROJECT_CPP_SRCS))
GENERATED_CPP_OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(GENERATED_CPP_SRCS))
OBJS := $(GENERATED_C_OBJS) $(PROJECT_CPP_OBJS) $(GENERATED_CPP_OBJS)

# 编译和链接标志
COMMON_CXXFLAGS := -std=gnu++11 -I./include $(EXTRA_CXXFLAGS)
PROJECT_WARNING_FLAGS ?= -Wall -Wextra
GENERATED_WARNING_FLAGS ?= -w
PROJECT_CXXFLAGS := $(COMMON_CXXFLAGS) -isystem ./lib -isystem $(PLCLOGIC_DIR) $(PROJECT_WARNING_FLAGS)
GENERATED_CXXFLAGS := $(COMMON_CXXFLAGS) -I./lib -I$(PLCLOGIC_DIR) $(GENERATED_WARNING_FLAGS)
LDFLAGS       := -pthread -fpermissive $(EXTRA_LDFLAGS)
LDLIBS        :=
ifdef ETHERCAT_INC
    PROJECT_CXXFLAGS += $(ETHERCAT_INC)
    GENERATED_CXXFLAGS += $(ETHERCAT_INC)
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
	$(CXX) $(GENERATED_CXXFLAGS) -c $< -o $@

# 编译项目维护的 C++ 源文件
$(PROJECT_CPP_OBJS): $(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(PROJECT_CXXFLAGS) -c $< -o $@

# 编译生成的绑定源文件
$(GENERATED_CPP_OBJS): $(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(GENERATED_CXXFLAGS) -c $< -o $@

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
	rm -rf build openplc openplc_instrumented

.PHONY: all clean
