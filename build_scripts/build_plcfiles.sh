#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <program.st>" >&2
    exit 2
fi

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
input_file=$1
output_dir=${PLCLOGIC_DIR:-"$repo_root/plclogic"}
default_iec2c="$repo_root/third_party/matiec/iec2c"
iec2c=${MATIEC_IEC2C:-"$default_iec2c"}

if [[ $input_file != /* ]]; then
    input_file="$repo_root/${input_file#./}"
fi

if [[ ! -f $input_file ]]; then
    echo "PLC source not found: $input_file" >&2
    exit 1
fi

if [[ ! -x $iec2c ]]; then
    echo "MatIEC compiler is not executable: $iec2c" >&2
    exit 1
fi

mkdir -p "$output_dir"
find "$output_dir" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +

matiec_args=()
if [[ -n ${MATIEC_INCLUDE_DIR:-} ]]; then
    matiec_args+=("-I" "$MATIEC_INCLUDE_DIR")
elif [[ $iec2c == "$default_iec2c" ]]; then
    matiec_args+=("-I" "$repo_root/third_party/matiec/lib")
fi
if [[ -n ${MATIEC_STD:-} ]]; then
    matiec_args+=("--std=$MATIEC_STD")
fi

echo "Compiling $input_file with $iec2c"
"$iec2c" "${matiec_args[@]}" -T "$output_dir" "$input_file"
