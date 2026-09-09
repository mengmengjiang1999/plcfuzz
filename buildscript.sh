#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo "Deprecated: use ./scripts/plcfuzz build instead." >&2
exec "$repo_root/scripts/plcfuzz" build "$@"
