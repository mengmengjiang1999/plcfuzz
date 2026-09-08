#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

maintained_files=(
    "$repo_root/README.md"
    "$repo_root/REPRODUCIBILITY.md"
    "$repo_root/docs/IMPROVEMENTS.md"
    "$repo_root/docs/CHANGELOG.md"
    "$repo_root/src/main.cpp"
    "$repo_root/src/buffer_history.cpp"
)

# These project-authored phrases are ambiguous without academic context. Exact
# third-party identifiers and quoted titles live outside this maintained set.
ambiguous_phrases='security research|crash capture|threat model|寻找崩溃|崩溃|漏洞|攻击|利用|武器化|入侵|黑客|威胁模型'

if rg --line-number --ignore-case "$ambiguous_phrases" "${maintained_files[@]}"; then
    echo "Maintained project text contains ambiguous wording; use the terminology in CONTRIBUTING.md." >&2
    exit 1
fi

rg --quiet "只用于经过授权的学术研究" "$repo_root/README.md"
rg --quiet "隔离的仿真环境或专用实验台" "$repo_root/README.md"
rg --quiet "历史草稿" "$repo_root/docs/archive/tmp.md"
rg --quiet "学术综述" "$repo_root/docs/research/PLC代码安全的文献综述.md"

echo "PASS project wording"
