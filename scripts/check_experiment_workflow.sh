#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
launcher="$repo_root/runfuzz.sh"
helper="$repo_root/scripts/experiment_manifest.py"

test -x "$helper"
rg --quiet 'EXPERIMENT_DIR' "$launcher"
rg --quiet 'experiment_manifest\.py.*create|create_arguments=' "$launcher"
rg --quiet 'experiment_manifest\.py.*finish|finish_arguments=' "$launcher"
rg --quiet 'afl-output' "$launcher"
python3 "$helper" --help >/dev/null

echo "PASS experiment workflow structure"
