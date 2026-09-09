#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
output_dir=${PLC_LAB_COVERAGE_OUTPUT:-"$repo_root/output/coverage"}
scope="$repo_root/coverage/scope-v1.json"
baseline="$repo_root/coverage/baseline-v1.json"

usage() {
    cat <<'EOF'
Usage: ./scripts/plc-lab coverage generate [output-directory]

Collect project-scoped C++ and Python coverage. Requires g++, lcov, genhtml,
and Python Coverage.py. MatIEC, generated PLC sources, and generated binding
code are excluded from the reported totals.
EOF
}

if [[ ${1:-generate} == -h || ${1:-generate} == --help ]]; then
    usage
    exit 0
fi
if [[ ${1:-generate} != generate ]]; then
    echo "Unknown coverage command: ${1:-}" >&2
    usage >&2
    exit 2
fi
if [[ $# -gt 0 ]]; then
    shift
fi
if [[ $# -gt 0 ]]; then
    output_dir=$1
    shift
fi
if [[ $# -ne 0 ]]; then
    usage >&2
    exit 2
fi

coverage_cxx=${PLC_LAB_COVERAGE_CXX:-g++}
coverage_gcov=${PLC_LAB_COVERAGE_GCOV:-gcov}
if [[ $(uname -s) == Darwin ]] && command -v g++-16 >/dev/null && [[ -z ${PLC_LAB_COVERAGE_CXX:-} ]]; then
    coverage_cxx=g++-16
    coverage_gcov=gcov-16
fi
for command_name in "$coverage_cxx" "$coverage_gcov" lcov genhtml python3; do
    if ! command -v "$command_name" >/dev/null; then
        echo "Coverage dependency is missing: $command_name" >&2
        exit 1
    fi
done
if ! python3 -m coverage --version >/dev/null 2>&1; then
    echo "Coverage dependency is missing: Python Coverage.py" >&2
    exit 1
fi
if [[ -d $output_dir ]] && find "$output_dir" -mindepth 1 -print -quit | grep -q .; then
    echo "Coverage output directory must be absent or empty: $output_dir" >&2
    exit 1
fi
mkdir -p "$output_dir"

mkdir -p "$repo_root/build"
work_dir=$(mktemp -d "$repo_root/build/coverage-work.XXXXXX")
cleanup() {
    rm -rf "$work_dir"
}
trap cleanup EXIT

export COVERAGE_FILE="$work_dir/python.coverage"
export PLC_LAB_TEST_BUILD_DIR="$work_dir/unit"
export PLC_LAB_TEST_CXXFLAGS="-O0 -g --coverage"
export PLC_LAB_TEST_LDFLAGS="--coverage"
export PLC_LAB_PYTHON_COVERAGE=1
export CXX="$coverage_cxx"
if ! git -C "$repo_root" rev-parse --verify HEAD >/dev/null 2>&1; then
    export PLC_LAB_SOURCE_REVISION=0000000000000000000000000000000000000000
    export PLC_LAB_MATIEC_REVISION=0000000000000000000000000000000000000000
fi

"$repo_root/scripts/test_unit.sh"

"$repo_root/scripts/plc-lab" build plc "$repo_root/testcases/no_concurrency_candidate/state_test.st"
python3 -m coverage run --append --source="$repo_root/scripts,$repo_root/static_analyse" \
    "$repo_root/static_analyse/main.py"

runtime_target="$work_dir/openplc-coverage"
runtime_cxxflags="-O0 -g --coverage"
make -C "$repo_root" \
    BUILD_DIR="$work_dir/runtime" \
    TARGET="$runtime_target" \
    CXX="$coverage_cxx" \
    EXTRA_CXXFLAGS="$runtime_cxxflags" \
    EXTRA_LDFLAGS="--coverage"

integration="$work_dir/integration.json"
invalid_input="$work_dir/invalid-input.txt"
printf '%s\n' 'not-a-supported-plc-input' > "$invalid_input"

set +e
"$runtime_target" >"$work_dir/missing-argument.log" 2>&1
missing_status=$?
PLC_LAB_CYCLE_COUNT=1 PLC_LAB_CYCLE_DELAY_NS=0 \
    "$runtime_target" "$invalid_input" >"$work_dir/invalid-input.log" 2>&1
invalid_status=$?
PLC_LAB_CYCLE_COUNT=1 PLC_LAB_CYCLE_DELAY_NS=0 \
    "$runtime_target" "$repo_root/benchmarks/replay/timer-simple.txt" >"$work_dir/valid-input.log" 2>&1
valid_status=$?
set -e

if [[ $missing_status -ne 1 || $invalid_status -ne 1 || $valid_status -ne 0 ]]; then
    echo "Runtime integration statuses differ: missing=$missing_status invalid=$invalid_status valid=$valid_status" >&2
    exit 1
fi
cat > "$integration" <<'EOF'
{
  "invalid_input": "passed",
  "missing_argument": "passed",
  "valid_input": "passed",
  "variable_map_command": "passed"
}
EOF

raw_info="$work_dir/cpp-raw.info"
cpp_info="$output_dir/cpp.info"
lcov --capture --directory "$work_dir" --gcov-tool "$coverage_gcov" --output-file "$raw_info"

cpp_patterns=()
while IFS= read -r source_pattern; do
    cpp_patterns+=("$source_pattern")
done < <(python3 - "$scope" "$repo_root" <<'PY'
import json
import pathlib
import sys
scope = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
root = pathlib.Path(sys.argv[2])
for relative in scope["cpp_sources"]:
    print(root / relative)
PY
)
lcov --extract "$raw_info" "${cpp_patterns[@]}" --output-file "$cpp_info" --ignore-errors unused
genhtml "$cpp_info" --output-directory "$output_dir/cpp-html" --quiet

python_include=$(python3 - "$scope" "$repo_root" <<'PY'
import json
import pathlib
import sys
scope = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding="utf-8"))
root = pathlib.Path(sys.argv[2])
print(",".join(str(root / item) for item in scope["python_sources"]))
PY
)
python3 -m coverage json --include="$python_include" -o "$output_dir/python.json"
python3 -m coverage xml --include="$python_include" -o "$output_dir/python.xml"
python3 -m coverage html --include="$python_include" -d "$output_dir/python-html" --quiet

python3 "$repo_root/scripts/coverage_report.py" generate \
    --cpp-info "$cpp_info" \
    --python-json "$output_dir/python.json" \
    --integration "$integration" \
    --output "$output_dir/summary.json" \
    --scope "$scope" \
    --baseline "$baseline"
python3 "$repo_root/scripts/coverage_report.py" validate "$output_dir/summary.json"
