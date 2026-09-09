#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo "Deprecated: use ./scripts/plcfuzz batch <case-name> instead." >&2
exec "$repo_root/scripts/plcfuzz" batch "$@"
