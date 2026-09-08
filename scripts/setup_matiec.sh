#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
matiec_dir="$repo_root/third_party/matiec"
jobs=${MATIEC_BUILD_JOBS:-1}

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
mkdir -p stage4/.deps
make --jobs="$jobs"

if [[ ${MATIEC_RUN_TESTS:-0} == 1 ]]; then
    make check LIBS="$matiec_dir/compiler/libcompiler.a"
fi

echo "MatIEC compiler: $matiec_dir/iec2c"
