#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$repo_root"

seed_dir=${SEED_DIR:-"$repo_root/seeds"}
findings_dir=${FINDINGS_DIR:-"$repo_root/findings"}
grammar=${AFL_GRAMMAR:-"$repo_root/fuzz_config/plc.grammar"}
mutator=${AFL_CUSTOM_MUTATOR_LIBRARY:-"$repo_root/build/mutator/libplc_mutator.so"}
target=${FUZZ_TARGET:-"$repo_root/openplc_fuzz"}
duration=${FUZZ_DURATION:-3600}
timeout=${FUZZ_TIMEOUT:-10000}

for required in "$seed_dir" "$grammar" "$mutator" "$target"; do
    if [[ ! -e $required ]]; then
        echo "Required fuzzing input is missing: $required" >&2
        exit 1
    fi
done

export AFL_AUTORESUME=${AFL_AUTORESUME:-1}
export AFL_CUSTOM_MUTATOR_LIBRARY="$mutator"
export AFL_MAP_SIZE=${AFL_MAP_SIZE:-10000000}
export AFL_SKIP_CPUFREQ=${AFL_SKIP_CPUFREQ:-1}

exec afl-fuzz \
    -V "$duration" \
    -t "$timeout" \
    -i "$seed_dir" \
    -o "$findings_dir" \
    -g "$grammar" \
    -- "$target" @@
