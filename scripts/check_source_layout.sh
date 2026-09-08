#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

if rg --quiet --fixed-strings '$(wildcard $(SRC_DIR)/*.cpp)' "$repo_root/Makefile"; then
    echo "Makefile must use an explicit runtime source manifest." >&2
    exit 1
fi

for source_path in "$repo_root"/src/*.cpp; do
    source_name=${source_path#"$repo_root/"}
    if [[ $source_name == src/glueVars.cpp ]]; then
        continue
    fi
    if ! rg --quiet --fixed-strings "\$(SRC_DIR)/${source_name#src/}" "$repo_root/Makefile"; then
        echo "Active source is missing from the Makefile manifest: $source_name" >&2
        exit 1
    fi
done

unexpected_paths=(
    fuzz_config/plc_back.grammar
    fuzz_config/tmp.grammar
    fuzz_config/plc_mutator-back.cpp
    static_analyse/plc_variables_mapping.csv
    src/server.cpp
    src/enip.cpp
    src/pccc.cpp
    src/modbus_master.cpp
    src/interactive_server.cpp
    src/client.cpp
    src/dnp3.cpp
    src/persistent_storage.cpp
)
for relative_path in "${unexpected_paths[@]}"; do
    if [[ -e "$repo_root/$relative_path" ]]; then
        echo "Historical file is present in an active directory: $relative_path" >&2
        exit 1
    fi
done

required_archive_paths=(
    artifacts/legacy/fuzz-config/tagged-blocks.grammar
    artifacts/legacy/fuzz-config/plc_mutator-pre-refactor.cpp
    artifacts/legacy/openplc-disabled-source/server.cpp
    artifacts/legacy/openplc-disabled-source/enip.cpp
    artifacts/legacy/openplc-disabled-source/pccc.cpp
    artifacts/legacy/openplc-disabled-source/modbus_master.cpp
    artifacts/legacy/openplc-disabled-source/interactive_server.cpp
    artifacts/legacy/openplc-disabled-source/client.cpp
    artifacts/legacy/openplc-disabled-source/dnp3.cpp
    artifacts/legacy/openplc-disabled-source/persistent_storage.cpp
)
for relative_path in "${required_archive_paths[@]}"; do
    if [[ ! -f "$repo_root/$relative_path" ]]; then
        echo "Expected archival file is missing: $relative_path" >&2
        exit 1
    fi
done

generated_mapping=$(mktemp "${TMPDIR:-/tmp}/plcfuzz-mapping.XXXXXX")
trap 'rm -f "$generated_mapping"' EXIT
python3 "$repo_root/static_analyse/main.py" \
    --input "$repo_root/tests/fixtures/reference_LOCATED_VARIABLES.h" \
    --output "$generated_mapping" >/dev/null

if ! cmp -s "$repo_root/plc_variables_mapping.csv" "$generated_mapping"; then
    echo "The root variable mapping does not match the tracked reference located-variable snapshot." >&2
    exit 1
fi

echo "PASS source layout"
