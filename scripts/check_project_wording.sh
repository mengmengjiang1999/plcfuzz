#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

# Scan every tracked project-authored text file. Raw AFL++ measurements retain
# their upstream schema, preserved executables remain byte-identical, and this
# script contains the search expression itself, so those narrow paths are exempt.
ambiguous_phrases='attack|exploit|weapon|intrusion|hack|vulnerab|security research|crash capture|threat model|offensive|pentest|cybersecurity|malware|backdoor|寻找崩溃|崩溃|漏洞|攻击|利用|武器化|入侵|黑客|威胁模型|恶意代码|后门'

cd "$repo_root"
if [[ -d .git ]]; then
    matches=$(git grep -I --line-number --ignore-case --extended-regexp "$ambiguous_phrases" -- . \
        ':!scripts/check_project_wording.sh' \
        ':!findings/**' \
        ':!findings copy/**' \
        ':!findings_compare_with_petrinet/default/fuzzer_stats' \
        ':!findings_compare_with_petrinet/default/plot_data' \
        ':!results/**' \
        ':!artifacts/legacy/matiec/iec2c' \
        ':!artifacts/legacy/matiec/iec2iec' \
        ':!artifacts/legacy/openplc_fuzz' \
        ':!tools/glue_generator' || true)
else
    matches=$(rg -I --line-number --ignore-case --hidden --glob '!scripts/check_project_wording.sh' \
        --glob '!findings/**' --glob '!findings copy/**' --glob '!findings_compare_with_petrinet/**' \
        --glob '!results/**' --glob '!artifacts/legacy/**' --glob '!third_party/**' --glob '!tools/glue_generator' \
        "$ambiguous_phrases" . || true)
fi

if [[ -n $matches ]]; then
    printf '%s\n' "$matches"
    echo "Project-authored text contains ambiguous wording; use the terminology in CONTRIBUTING.md." >&2
    exit 1
fi

rg --quiet "只用于经过授权的学术研究" "$repo_root/README.md"
rg --quiet "隔离的仿真环境或专用实验台" "$repo_root/README.md"
rg --quiet "原始统计文件保持第三方工具的字段名称不变" "$repo_root/README.md"

test ! -e "$repo_root/docs/archive/tmp.md"
test ! -e "$repo_root/docs/archive/一些脚本介绍.md"
test ! -e "$repo_root/docs/archive/常用的prompt.md"
test ! -e "$repo_root/docs/research/PLC代码安全的文献综述.md"

echo "PASS project wording"
