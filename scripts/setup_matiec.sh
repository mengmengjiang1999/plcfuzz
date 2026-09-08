#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
matiec_dir="$repo_root/third_party/matiec"
jobs=${BUILD_JOBS:-2}

if [[ -x /opt/homebrew/opt/bison/bin/bison ]]; then
    export PATH="/opt/homebrew/opt/bison/bin:$PATH"
elif [[ -x /usr/local/opt/bison/bin/bison ]]; then
    export PATH="/usr/local/opt/bison/bin:$PATH"
fi

if [[ ! -f $matiec_dir/configure.ac ]]; then
    echo "MatIEC submodule is not initialized." >&2
    echo "Run: git submodule update --init --recursive" >&2
    exit 1
fi

cd "$matiec_dir"
autoreconf --install
./configure
make --jobs="$jobs"

if [[ ${MATIEC_RUN_TESTS:-0} == 1 ]]; then
    make check
fi

echo "MatIEC compiler: $matiec_dir/iec2c"
