#!/usr/bin/env python3
"""Extract PLC variable bindings from OpenPLC's generated glueVars.cpp."""

import argparse
import csv
import re
from pathlib import Path


PATTERNS = {
    "bool_inputs": r"bool_input\[([^\]]+)\]\[([^\]]+)\] = \(IEC_BOOL \*\)([^;]+);",
    "bool_outputs": r"bool_output\[([^\]]+)\]\[([^\]]+)\] = \(IEC_BOOL \*\)([^;]+);",
    "byte_inputs": r"byte_input\[([^\]]+)\] = \(IEC_BYTE \*\)([^;]+);",
    "byte_outputs": r"byte_output\[([^\]]+)\] = \(IEC_BYTE \*\)([^;]+);",
    "int_inputs": r"int_input\[([^\]]+)\] = \(IEC_UINT \*\)([^;]+);",
    "int_outputs": r"int_output\[([^\]]+)\] = \(IEC_UINT \*\)([^;]+);",
    "dint_inputs": r"dint_input\[([^\]]+)\] = \(IEC_UDINT \*\)([^;]+);",
    "dint_outputs": r"dint_output\[([^\]]+)\] = \(IEC_UDINT \*\)([^;]+);",
    "lint_inputs": r"lint_input\[([^\]]+)\] = \(IEC_ULINT \*\)([^;]+);",
    "lint_outputs": r"lint_output\[([^\]]+)\] = \(IEC_ULINT \*\)([^;]+);",
    "int_memory": r"int_memory\[([^\]]+)\] = \(IEC_UINT \*\)([^;]+);",
    "dint_memory": r"dint_memory\[([^\]]+)\] = \(IEC_UDINT \*\)([^;]+);",
    "lint_memory": r"lint_memory\[([^\]]+)\] = \(IEC_ULINT \*\)([^;]+);",
}


def extract_all_glue_variables(file_path: Path):
    result = {name: [] for name in PATTERNS}
    content = file_path.read_text(encoding="utf-8")
    gluevars_func = re.search(r"void glueVars\(\)\s*\{([^}]+)\}", content, re.DOTALL)
    if not gluevars_func:
        raise ValueError(f"glueVars() was not found in {file_path}")

    bindings = gluevars_func.group(1)
    for variable_type, pattern in PATTERNS.items():
        for match in re.finditer(pattern, bindings):
            if variable_type in ("bool_inputs", "bool_outputs"):
                item = {
                    "array_index": match.group(1),
                    "bit_index": match.group(2),
                    "var_name": match.group(3).strip(),
                }
            else:
                item = {
                    "array_index": match.group(1),
                    "var_name": match.group(2).strip(),
                }
            result[variable_type].append(item)
    return result


def print_variable_summary(variables):
    print("=== PLC variable bindings ===")
    for variable_type, items in variables.items():
        print(f"{variable_type}: {len(items)}")


def save_to_csv(variables, output_file: Path):
    with output_file.open("w", encoding="utf-8", newline="") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(["变量类型", "数组索引", "位索引(仅布尔)", "变量名"])
        for variable_type, items in variables.items():
            for item in items:
                writer.writerow(
                    [variable_type, item["array_index"], item.get("bit_index", ""), item["var_name"]]
                )


def parse_args():
    repository_root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--input",
        type=Path,
        default=repository_root / "src" / "glueVars.cpp",
        help="generated glueVars.cpp path",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=repository_root / "plc_variables_mapping.csv",
        help="output CSV path",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    variables = extract_all_glue_variables(args.input)
    save_to_csv(variables, args.output)
    print_variable_summary(variables)
    print(f"Wrote {args.output}")


if __name__ == "__main__":
    main()
