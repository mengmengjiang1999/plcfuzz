#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
helper="$repo_root/scripts/comparison_plan.py"
registry="$repo_root/evaluation/strategies-v1.json"

test -x "$helper"
test -f "$registry"
rg --quiet 'PLC_LAB_INPUT_STRATEGY' "$repo_root/scripts/run_experiment.sh"
rg --quiet 'random-bytes' "$repo_root/scripts/run_experiment.sh" "$registry"
rg --quiet 'protocol-valid' "$repo_root/scripts/run_experiment.sh" "$registry"
rg --quiet 'structure-aware' "$repo_root/scripts/run_experiment.sh" "$registry"
rg --quiet 'state-feedback' "$repo_root/scripts/run_experiment.sh" "$registry"
rg --quiet 'comparison.*comparison_plan\.py' "$repo_root/scripts/plc-lab"
python3 "$helper" --help >/dev/null

echo "PASS comparison workflow structure"
