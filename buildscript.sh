#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$repo_root"

usage() {
    cat <<'EOF'
Usage: ./buildscript.sh [step] [program.st]

Steps:
  all       Run PLC conversion, runtime build, analysis, mutator build, and fuzz build (default)
  plc       Convert Structured Text to C
  runtime   Build the non-instrumented OpenPLC target
  analyze   Generate plc_variables_mapping.csv
  mutator   Build the AFL++ custom mutator
  fuzz      Build the AFL++-instrumented target

The default input is testcases/race_test_success.st.
EOF
}

step=${1:-all}
input_file=${2:-testcases/race_test_success.st}

case "$step" in
    -h|--help)
        usage
        exit 0
        ;;
    all|plc|runtime|c|analyze|analysis|mutator|lib|library|fuzz)
        ;;
    *.st)
        input_file=$step
        step=all
        ;;
    *)
        echo "Unknown build step: $step" >&2
        usage >&2
        exit 2
        ;;
esac

build_plc() {
    "$repo_root/build_scripts/build_plcfiles.sh" "$input_file"
}

build_runtime() {
    "$repo_root/build_scripts/build.sh"
}

analyze_variables() {
    python3 "$repo_root/static_analyse/main.py"
}

build_mutator() {
    "$repo_root/build_scripts/build_shared_library.sh"
}

build_fuzz() {
    "$repo_root/build_scripts/buildfuzz.sh"
}

case "$step" in
    all)
        build_plc
        build_runtime
        analyze_variables
        build_mutator
        build_fuzz
        ;;
    plc) build_plc ;;
    runtime|c) build_runtime ;;
    analyze|analysis) analyze_variables ;;
    mutator|lib|library) build_mutator ;;
    fuzz) build_fuzz ;;
esac
