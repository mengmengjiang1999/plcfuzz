#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$repo_root"

seed_dir=${SEED_DIR:-"$repo_root/seeds"}
findings_root=${FINDINGS_DIR:-"$repo_root/findings"}
experiment_dir=${EXPERIMENT_DIR:-}
grammar=${AFL_GRAMMAR:-"$repo_root/fuzz_config/plc.grammar"}
mutator=${AFL_CUSTOM_MUTATOR_LIBRARY:-"$repo_root/build/mutator/libplc_mutator.so"}
target=${FUZZ_TARGET:-"$repo_root/openplc_fuzz"}
duration=${FUZZ_DURATION:-3600}
timeout=${FUZZ_TIMEOUT:-10000}
afl_binary=${AFL_FUZZ_BINARY:-afl-fuzz}

for required in "$seed_dir" "$grammar" "$mutator" "$target"; do
    if [[ ! -e $required ]]; then
        echo "Required fuzzing input is missing: $required" >&2
        exit 1
    fi
done

if ! command -v "$afl_binary" >/dev/null 2>&1; then
    echo "Required automated-input tool is unavailable: $afl_binary" >&2
    exit 1
fi

export AFL_AUTORESUME=${AFL_AUTORESUME:-1}
export AFL_CUSTOM_MUTATOR_LIBRARY="$mutator"
export AFL_MAP_SIZE=${AFL_MAP_SIZE:-10000000}
export AFL_SKIP_CPUFREQ=${AFL_SKIP_CPUFREQ:-1}

create_arguments=(
    create
    --repo-root "$repo_root"
    --findings-root "$findings_root"
    --target "$target"
    --seed-dir "$seed_dir"
    --grammar "$grammar"
    --mutator "$mutator"
    --duration "$duration"
    --timeout "$timeout"
    --afl-binary "$afl_binary"
)
if [[ -n $experiment_dir ]]; then
    create_arguments+=(--experiment-dir "$experiment_dir")
fi

experiment_dir=$(python3 "$repo_root/scripts/experiment_manifest.py" "${create_arguments[@]}")
manifest_path="$experiment_dir/manifest.json"
interrupted=0

finalize_manifest() {
    local run_status=$?
    local manifest_status=0
    trap - EXIT
    set +e
    finish_arguments=(finish --manifest "$manifest_path" --exit-code "$run_status")
    if [[ $interrupted -eq 1 ]]; then
        finish_arguments+=(--interrupted)
    fi
    python3 "$repo_root/scripts/experiment_manifest.py" "${finish_arguments[@]}"
    manifest_status=$?
    if [[ $run_status -ne 0 ]]; then
        exit "$run_status"
    fi
    exit "$manifest_status"
}

handle_interrupt() {
    interrupted=1
    exit "$1"
}

trap finalize_manifest EXIT
trap 'handle_interrupt 130' INT
trap 'handle_interrupt 143' TERM
trap 'handle_interrupt 129' HUP

echo "Experiment directory: $experiment_dir"
"$afl_binary" \
    -V "$duration" \
    -t "$timeout" \
    -i "$seed_dir" \
    -o "$experiment_dir/afl-output" \
    -g "$grammar" \
    -- "$target" @@
