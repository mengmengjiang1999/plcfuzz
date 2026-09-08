#pragma once

#include <cerrno>
#include <climits>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

#include "ladder.h"

struct VariableMapping {
    std::string var_type;
    int array_index;
    int bit_index;
    std::string var_name;
};

inline std::runtime_error mapping_error(const std::string& path,
                                        std::size_t row,
                                        const std::string& message) {
    std::ostringstream output;
    output << path;
    if(row != 0) {
        output << ':' << row;
    }
    output << ": " << message;
    return std::runtime_error(output.str());
}

inline std::vector<std::string> split_mapping_row(std::string line) {
    if(!line.empty() && line[line.size() - 1] == '\r') {
        line.erase(line.size() - 1);
    }
    std::vector<std::string> fields;
    std::stringstream stream(line);
    std::string field;
    while(std::getline(stream, field, ',')) {
        fields.push_back(field);
    }
    if(!line.empty() && line[line.size() - 1] == ',') {
        fields.push_back(std::string());
    }
    return fields;
}

inline int parse_mapping_index(const std::string& value,
                               const std::string& path,
                               std::size_t row,
                               const char* field_name) {
    if(value.empty()) {
        throw mapping_error(path, row, std::string(field_name) + " is empty");
    }
    errno = 0;
    char* end = NULL;
    const long parsed = std::strtol(value.c_str(), &end, 10);
    if(errno == ERANGE || end == value.c_str() || *end != '\0' || parsed < 0 || parsed > INT_MAX) {
        throw mapping_error(path, row, std::string("invalid ") + field_name + ": " + value);
    }
    return static_cast<int>(parsed);
}

inline bool is_bool_mapping(const std::string& type) {
    return type == "bool_inputs" || type == "bool_outputs";
}

inline bool is_input_mapping(const std::string& type) {
    return type == "bool_inputs" || type == "byte_inputs" || type == "int_inputs" ||
           type == "dint_inputs" || type == "lint_inputs" || type == "int_memory" ||
           type == "dint_memory" || type == "lint_memory";
}

inline bool is_supported_mapping(const std::string& type) {
    return is_input_mapping(type) || type == "bool_outputs" || type == "byte_outputs" ||
           type == "int_outputs" || type == "dint_outputs" || type == "lint_outputs";
}

inline std::vector<VariableMapping> load_variable_mappings(const std::string& path) {
    std::ifstream file(path.c_str());
    if(!file.is_open()) {
        throw mapping_error(path, 0, "cannot open variable mapping");
    }

    std::string line;
    if(!std::getline(file, line) || split_mapping_row(line).size() != 4) {
        throw mapping_error(path, 1, "expected a four-column header");
    }

    std::vector<VariableMapping> mappings;
    std::size_t row = 1;
    while(std::getline(file, line)) {
        ++row;
        if(line.empty() || line == "\r") {
            continue;
        }
        const std::vector<std::string> fields = split_mapping_row(line);
        if(fields.size() != 4) {
            throw mapping_error(path, row, "expected exactly four columns");
        }
        if(!is_supported_mapping(fields[0])) {
            throw mapping_error(path, row, "unsupported variable type: " + fields[0]);
        }

        VariableMapping mapping;
        mapping.var_type = fields[0];
        mapping.array_index = parse_mapping_index(fields[1], path, row, "array index");
        if(is_input_mapping(mapping.var_type) && mapping.array_index >= PLC_INPUT_SIZE) {
            throw mapping_error(path, row, "input array index exceeds PLC_INPUT_SIZE");
        }
        if(!is_input_mapping(mapping.var_type) && mapping.array_index >= OPENPLC_BUFFER_SIZE) {
            throw mapping_error(path, row, "output array index exceeds OPENPLC_BUFFER_SIZE");
        }

        if(is_bool_mapping(mapping.var_type)) {
            mapping.bit_index = parse_mapping_index(fields[2], path, row, "bit index");
            if(mapping.bit_index >= 8) {
                throw mapping_error(path, row, "bit index must be between 0 and 7");
            }
        } else {
            if(!fields[2].empty()) {
                throw mapping_error(path, row, "bit index must be empty for non-boolean variables");
            }
            mapping.bit_index = -1;
        }
        if(fields[3].empty()) {
            throw mapping_error(path, row, "variable name is empty");
        }
        mapping.var_name = fields[3];
        mappings.push_back(mapping);
    }

    if(mappings.empty()) {
        throw mapping_error(path, 0, "variable mapping has no data rows");
    }
    return mappings;
}
