#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
launcher="$repo_root/scripts/run_experiment.sh"
helper="$repo_root/scripts/experiment_manifest.py"

test -x "$helper"
rg --quiet 'EXPERIMENT_DIR' "$launcher"
rg --quiet 'experiment_manifest\.py.*create|create_arguments=' "$launcher"
rg --quiet 'experiment_manifest\.py.*finish|finish_arguments=' "$launcher"
rg --quiet 'afl-output' "$launcher"
rg --quiet 'INPUT_SAMPLES_DIR' "$launcher"
rg --quiet 'OBSERVATIONS_DIR' "$launcher"
rg --quiet 'PLC_LAB_INPUT_TRANSFORMER_LIBRARY' "$launcher"
rg --quiet 'AUTOMATED_INPUT_TOOL' "$launcher"
rg --quiet 'PLC_LAB_EXPERIMENT_MANIFEST_V1' "$helper"
rg --quiet 'experiment.*run_experiment\.sh' "$repo_root/scripts/plc-lab"
python3 "$helper" --help >/dev/null

echo "PASS experiment workflow structure"
