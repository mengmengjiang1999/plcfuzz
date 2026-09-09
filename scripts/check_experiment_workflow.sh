#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
launcher="$repo_root/scripts/run_experiment.sh"
helper="$repo_root/scripts/experiment_manifest.py"
protocol_helper="$repo_root/scripts/evaluation_protocol.py"
protocol="$repo_root/evaluation/protocol-v1.json"

test -x "$helper"
test -x "$protocol_helper"
test -f "$protocol"
rg --quiet 'EXPERIMENT_DIR' "$launcher"
rg --quiet 'experiment_manifest\.py.*create|create_arguments=' "$launcher"
rg --quiet 'experiment_manifest\.py.*finish|finish_arguments=' "$launcher"
rg --quiet 'afl-output' "$launcher"
rg --quiet 'INPUT_SAMPLES_DIR' "$launcher"
rg --quiet 'OBSERVATIONS_DIR' "$launcher"
rg --quiet 'PLC_LAB_INPUT_TRANSFORMER_LIBRARY' "$launcher"
rg --quiet 'AUTOMATED_INPUT_TOOL' "$launcher"
rg --quiet 'EVALUATION_PROTOCOL' "$launcher"
rg --quiet 'EVALUATION_REPLICATE_SEED' "$launcher"
rg --quiet -- '-s.*evaluation_replicate_seed' "$launcher"
rg --quiet 'evaluation-result\.json' "$helper"
rg --quiet 'PLC_LAB_EXPERIMENT_MANIFEST_V1' "$helper"
rg --quiet 'experiment.*run_experiment\.sh' "$repo_root/scripts/plc-lab"
rg --quiet 'evaluation.*evaluation_protocol\.py' "$repo_root/scripts/plc-lab"
python3 "$helper" --help >/dev/null
python3 "$protocol_helper" validate-protocol "$protocol" >/dev/null
python3 "$protocol_helper" template --help >/dev/null

echo "PASS experiment workflow structure"
