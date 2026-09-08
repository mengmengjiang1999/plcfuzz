#!/usr/bin/env python3
"""Generate the OpenPLC runtime mapping from MatIEC located-variable records."""

import argparse
import csv
import os
from pathlib import Path
import re
import tempfile


CSV_HEADER = ["变量类型", "数组索引", "位索引(仅布尔)", "变量名"]
RECORD_PATTERN = re.compile(r"^\s*__LOCATED_VAR\(([^()]*)\)\s*$")
DECIMAL_PATTERN = re.compile(r"^(0|[1-9][0-9]*)$")
TYPE_WIDTHS = {
    "X": {"BOOL"},
    "B": {"BYTE", "SINT", "USINT"},
    "W": {"WORD", "INT", "UINT"},
    "D": {"DWORD", "DINT", "UDINT", "REAL"},
    "L": {"LWORD", "LINT", "ULINT", "LREAL"},
}
IO_MAPPINGS = {
    ("I", "X"): "bool_inputs",
    ("Q", "X"): "bool_outputs",
    ("I", "B"): "byte_inputs",
    ("Q", "B"): "byte_outputs",
    ("I", "W"): "int_inputs",
    ("Q", "W"): "int_outputs",
    ("I", "D"): "dint_inputs",
    ("Q", "D"): "dint_outputs",
    ("I", "L"): "lint_inputs",
    ("Q", "L"): "lint_outputs",
    ("M", "W"): "int_memory",
    ("M", "D"): "dint_memory",
    ("M", "L"): "lint_memory",
}


class MappingError(ValueError):
    pass


def record_error(path, line_number, message):
    return MappingError("{}:{}: {}".format(path, line_number, message))


def parse_index(value, path, line_number, label):
    if not DECIMAL_PATTERN.fullmatch(value):
        raise record_error(path, line_number, "{} must be a non-negative decimal integer".format(label))
    return int(value)


def parse_located_variables(file_path):
    mappings = []
    destinations = set()
    content = Path(file_path).read_text(encoding="utf-8")

    for line_number, line in enumerate(content.splitlines(), start=1):
        if not line.strip():
            continue
        match = RECORD_PATTERN.fullmatch(line)
        if match is None:
            raise record_error(file_path, line_number, "expected one __LOCATED_VAR(...) record")

        fields = [field.strip() for field in match.group(1).split(",")]
        if len(fields) not in (5, 6) or any(not field for field in fields):
            raise record_error(file_path, line_number, "record must contain five or six non-empty fields")

        iec_type, symbolic_name, area, width = fields[:4]
        mapping_type = IO_MAPPINGS.get((area, width))
        if mapping_type is None:
            raise record_error(file_path, line_number, "unsupported location class {}{}".format(area, width))
        if iec_type not in TYPE_WIDTHS[width]:
            raise record_error(
                file_path,
                line_number,
                "IEC type {} is incompatible with width {}".format(iec_type, width),
            )

        array_index = parse_index(fields[4], file_path, line_number, "array index")
        bit_index = ""
        if width == "X":
            if len(fields) != 6:
                raise record_error(file_path, line_number, "bit location requires a bit index")
            bit_value = parse_index(fields[5], file_path, line_number, "bit index")
            if bit_value > 7:
                raise record_error(file_path, line_number, "bit index must be between 0 and 7")
            bit_index = str(bit_value)
        elif len(fields) != 5:
            raise record_error(file_path, line_number, "non-bit location must not contain a bit index")

        expected_name = "__{}{}{}".format(area, width, array_index)
        if width == "X":
            expected_name += "_" + bit_index
        if symbolic_name != expected_name:
            raise record_error(
                file_path,
                line_number,
                "symbolic name {} does not match {}".format(symbolic_name, expected_name),
            )

        destination = (mapping_type, array_index, bit_index)
        if destination in destinations:
            raise record_error(file_path, line_number, "duplicate runtime destination {}".format(destination))
        destinations.add(destination)
        mappings.append([mapping_type, str(array_index), bit_index, symbolic_name])

    if not mappings:
        raise MappingError("{}: no located-variable records found".format(file_path))
    return mappings


def save_to_csv(mappings, output_file):
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=output_path.name + ".", dir=str(output_path.parent))
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8", newline="") as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(CSV_HEADER)
            writer.writerows(mappings)
        os.replace(temporary_name, output_path)
    except Exception:
        try:
            os.unlink(temporary_name)
        except FileNotFoundError:
            pass
        raise


def parse_args():
    repository_root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--input",
        type=Path,
        default=repository_root / "plclogic" / "LOCATED_VARIABLES.h",
        help="MatIEC LOCATED_VARIABLES.h path",
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
    try:
        mappings = parse_located_variables(args.input)
        save_to_csv(mappings, args.output)
    except (OSError, MappingError) as error:
        raise SystemExit("Mapping generation failed: {}".format(error))
    print("Wrote {} variable bindings to {}".format(len(mappings), args.output))


if __name__ == "__main__":
    main()
