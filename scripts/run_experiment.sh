#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

compat_value() {
    local canonical_name=$1
    local legacy_name=$2
    local default_value=$3
    local canonical_value=${!canonical_name:-}
    local legacy_value=${!legacy_name:-}
    if [[ -n $canonical_value ]]; then
        printf '%s' "$canonical_value"
    elif [[ -n $legacy_value ]]; then
        echo "Deprecated environment variable $legacy_name; use $canonical_name." >&2
        printf '%s' "$legacy_value"
    else
        printf '%s' "$default_value"
    fi
}

input_samples_dir=$(compat_value INPUT_SAMPLES_DIR SEED_DIR "$repo_root/input_samples")
observations_root=$(compat_value OBSERVATIONS_DIR FINDINGS_DIR "$repo_root/observations")
experiment_dir=${EXPERIMENT_DIR:-}
grammar=${INPUT_GRAMMAR:-${AFL_GRAMMAR:-"$repo_root/input_generation/plc.grammar"}}
input_transformer=${PLC_LAB_INPUT_TRANSFORMER_LIBRARY:-${AFL_CUSTOM_MUTATOR_LIBRARY:-"$repo_root/build/input-transformer/libplc_input_transformer.so"}}
target=$(compat_value INSTRUMENTED_TARGET FUZZ_TARGET "$repo_root/openplc_instrumented")
duration=$(compat_value EXPERIMENT_DURATION FUZZ_DURATION 3600)
timeout=$(compat_value EXECUTION_TIMEOUT FUZZ_TIMEOUT 10000)
input_tool=$(compat_value AUTOMATED_INPUT_TOOL AFL_FUZZ_BINARY afl-fuzz)
evaluation_protocol=${EVALUATION_PROTOCOL:-}
evaluation_benchmark_id=${EVALUATION_BENCHMARK_ID:-}
evaluation_strategy_id=${EVALUATION_STRATEGY_ID:-}
evaluation_replicate_index=${EVALUATION_REPLICATE_INDEX:-}
evaluation_replicate_seed=${EVALUATION_REPLICATE_SEED:-}

evaluation_values=(
    "$evaluation_protocol"
    "$evaluation_benchmark_id"
    "$evaluation_strategy_id"
    "$evaluation_replicate_index"
    "$evaluation_replicate_seed"
)
evaluation_count=0
for evaluation_value in "${evaluation_values[@]}"; do
    if [[ -n $evaluation_value ]]; then
        evaluation_count=$((evaluation_count + 1))
    fi
done
if [[ $evaluation_count -ne 0 && $evaluation_count -ne ${#evaluation_values[@]} ]]; then
    echo "Evaluation environment variables must be supplied together." >&2
    exit 2
fi

for required in "$input_samples_dir" "$grammar" "$input_transformer" "$target"; do
    if [[ ! -e $required ]]; then
        echo "Required experiment input is missing: $required" >&2
        exit 1
    fi
done

if ! command -v "$input_tool" >/dev/null 2>&1; then
    echo "Required automated-input tool is unavailable: $input_tool" >&2
    exit 1
fi

export AFL_AUTORESUME=${AFL_AUTORESUME:-1}
export AFL_CUSTOM_MUTATOR_LIBRARY="$input_transformer"
export AFL_MAP_SIZE=${AFL_MAP_SIZE:-10000000}
export AFL_SKIP_CPUFREQ=${AFL_SKIP_CPUFREQ:-1}

create_arguments=(
    create
    --repo-root "$repo_root"
    --observations-root "$observations_root"
    --target "$target"
    --input-samples-dir "$input_samples_dir"
    --grammar "$grammar"
    --input-transformer "$input_transformer"
    --duration "$duration"
    --timeout "$timeout"
    --input-tool "$input_tool"
)
if [[ -n $experiment_dir ]]; then
    create_arguments+=(--experiment-dir "$experiment_dir")
fi
if [[ $evaluation_count -ne 0 ]]; then
    create_arguments+=(
        --evaluation-protocol "$evaluation_protocol"
        --evaluation-benchmark-id "$evaluation_benchmark_id"
        --evaluation-strategy-id "$evaluation_strategy_id"
        --evaluation-replicate-index "$evaluation_replicate_index"
        --evaluation-replicate-seed "$evaluation_replicate_seed"
    )
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
run_arguments=(
    -V "$duration"
    -t "$timeout"
    -i "$input_samples_dir"
    -o "$experiment_dir/afl-output"
    -g "$grammar"
    -- "$target" @@
)
if [[ $evaluation_count -ne 0 ]]; then
    run_arguments=(-s "$evaluation_replicate_seed" "${run_arguments[@]}")
fi
"$input_tool" "${run_arguments[@]}"
