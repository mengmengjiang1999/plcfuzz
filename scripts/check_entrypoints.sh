#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
entrypoint="$repo_root/scripts/plc-lab"

test -x "$entrypoint"
for implementation in run_runtime.sh run_experiment.sh replay_input.sh run_batch.sh; do
    test -x "$repo_root/scripts/$implementation"
    bash -n "$repo_root/scripts/$implementation"
done

wrappers=(
    buildscript.sh
    buildscript_new.sh
    count_code.sh
    run.sh
    run_fuzz_all.sh
    run_single_fuzz_example.sh
    runfuzz.sh
)

legacy_dispatcher="$repo_root/scripts/plcfuzz"
test -x "$legacy_dispatcher"
bash -n "$legacy_dispatcher"
rg --quiet 'Deprecated compatibility command: use ./scripts/plc-lab instead' "$legacy_dispatcher"
rg --quiet 'exec "\$repo_root/scripts/plc-lab" "\$@"' "$legacy_dispatcher"
if [[ $(wc -l < "$legacy_dispatcher") -gt 7 ]]; then
    echo "Former dispatcher contains workflow implementation." >&2
    exit 1
fi
for wrapper in "${wrappers[@]}"; do
    path="$repo_root/$wrapper"
    test -x "$path"
    bash -n "$path"
    rg --quiet '^echo "Deprecated: use \./scripts/plc-lab ' "$path"
    rg --quiet 'exec "\$repo_root/scripts/plc-lab"' "$path"
    if [[ $(wc -l < "$path") -gt 7 ]]; then
        echo "Compatibility wrapper contains workflow implementation: $wrapper" >&2
        exit 1
    fi
done

bash -n "$entrypoint"
help_output=$($entrypoint --help)
for command_name in setup build run experiment replay test batch diagnostics lines; do
    if [[ $help_output != *"$command_name"* ]]; then
        echo "Unified help is missing command: $command_name" >&2
        exit 1
    fi
done
$entrypoint build --help >/dev/null
$entrypoint test --help >/dev/null
if $entrypoint unsupported-command >/dev/null 2>&1; then
    echo "Unknown unified command unexpectedly succeeded." >&2
    exit 1
fi

rg --quiet 'scripts/plc-lab.*experiment' "$repo_root/scripts/run_batch.sh"
rg --quiet 'OBSERVATIONS_DIR=' "$repo_root/scripts/run_batch.sh"
if rg --quiet 'findings/default' "$repo_root/scripts/run_batch.sh"; then
    echo "Batch workflow must not use a fixed shared result directory." >&2
    exit 1
fi

echo "PASS unified command entrypoints"
