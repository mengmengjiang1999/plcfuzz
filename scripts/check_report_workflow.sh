#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
helper="$repo_root/scripts/experiment_report.py"

test -x "$helper"
rg --quiet 'PLC_LAB_EXPERIMENT_REPORT_V1' "$helper"
rg --quiet 'summary\.csv' "$helper"
rg --quiet 'interval_95' "$helper"
rg --quiet 'stable_digest' "$helper"
rg --quiet 'report.*experiment_report\.py' "$repo_root/scripts/plc-lab"
python3 "$helper" --help >/dev/null

echo "PASS report workflow structure"
