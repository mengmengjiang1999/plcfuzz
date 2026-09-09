#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
exec "$repo_root/build_scripts/build_plcfiles.sh" \
    "${1:-$repo_root/testcases/concurrency_reference.st}"
