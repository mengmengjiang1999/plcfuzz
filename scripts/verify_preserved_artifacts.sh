#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

check_sha256() {
    expected=$1
    path=$2

    if command -v sha256sum >/dev/null 2>&1; then
        actual=$(sha256sum "$path" | awk '{print $1}')
    else
        actual=$(shasum -a 256 "$path" | awk '{print $1}')
    fi

    if [ "$actual" != "$expected" ]; then
        echo "checksum mismatch: $path" >&2
        echo "expected: $expected" >&2
        echo "actual:   $actual" >&2
        exit 1
    fi
}

check_sha256 2008c1c9740ccc38f4ceb6f98b1a82d095743334ff70876e97d9bb0bf1d2e54e tools/iec2c
check_sha256 9598c16d5b75f5dac5880f53d3f6372d6b5a5bd168cdb883531b2a254717653a tools/iec2iec
check_sha256 57b43f8b211f5745288175001c4f6b44f8012966eaac06593601b772683bf062 tools/glue_generator
check_sha256 3d922cfd0675136be169327a630c73cbd4485923e84ea65b38e2b76d07d29f4f openplc_fuzz

test -d findings
test -d "findings copy"

echo "Preserved binaries and findings directories are present; binary checksums match."
