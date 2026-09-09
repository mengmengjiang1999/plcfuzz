#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

# Scan every tracked project-authored text file. Raw AFL++ measurements retain
# their upstream schema, preserved executables remain byte-identical, and this
# script contains the search expression itself, so those narrow paths are exempt.
ambiguous_phrases='attack|exploit|weapon|intrusion|hack|vulnerab|security research|crash capture|threat model|offensive|pentest|cybersecurity|malware|backdoor|寻找崩溃|崩溃|漏洞|攻击|利用|武器化|入侵|黑客|威胁模型|恶意代码|后门'
deprecated_project_terms='fuzz_config|plc_mutator|mutator_helper|openplc_fuzz|buildfuzz|build/mutator|build/fuzz|custom[- _]mutator|自定义变异器|FUZZ_DURATION|FUZZ_TIMEOUT|FUZZ_TARGET|AFL_FUZZ_BINARY|FINDINGS_DIR|SEED_DIR|race_bug|auto_race'

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

# Project-owned names use neutral terminology. Exact compatibility tokens,
# preserved artifact paths, and historical change links remain reviewable in
# context rather than being silently hidden by a broad directory exemption.
deprecated_matches=$(git grep -I --line-number --ignore-case --extended-regexp "$deprecated_project_terms" -- . \
    ':!scripts/check_project_wording.sh' \
    ':!openspec/changes/archive/**' \
    ':!testcases/archive/**' \
    ':!testcases/manifest.tsv' \
    ':!tests/experiment_manifest_test.py' \
    ':!findings/**' \
    ':!findings copy/**' \
    ':!findings_compare_with_petrinet/**' \
    ':!results/**' \
    ':!artifacts/**' || true)
deprecated_matches=$(printf '%s\n' "$deprecated_matches" | rg -v \
    'artifacts/legacy/(openplc_fuzz|fuzz-config)|make-mutator-deterministic|scripts/plcfuzz|AFL_CUSTOM_MUTATOR|compatib|former|Deprecated environment variable|compat_value' || true)
if [[ -n $deprecated_matches ]]; then
    printf '%s\n' "$deprecated_matches"
    echo "Maintained project-owned content contains deprecated terminology." >&2
    exit 1
fi

former_display_name=$(git grep -I --line-number --fixed-strings 'PLCFuzz' -- . \
    ':!scripts/check_project_wording.sh' \
    ':!openspec/changes/archive/**' \
    ':!artifacts/**' \
    ':!findings/**' \
    ':!findings copy/**' \
    ':!results/**' || true)
if [[ -n $former_display_name ]]; then
    printf '%s\n' "$former_display_name"
    echo "Maintained text contains the former project display name." >&2
    exit 1
fi

path_matches=''
while IFS= read -r path; do
    case "$path" in
        artifacts/*|findings/*|"findings copy"/*|findings_compare_with_petrinet/*|results/*|openspec/changes/archive/*|testcases/archive/*|scripts/plcfuzz|runfuzz.sh|run_fuzz_all.sh|run_single_fuzz_example.sh)
            continue
            ;;
    esac
    if [[ $path =~ (fuzz_config|plc_mutator|mutator_helper|openplc_fuzz|buildfuzz|race_bug|auto_race) ]]; then
        path_matches+="$path"$'\n'
    fi
done < <(git ls-files)
if [[ -n $path_matches ]]; then
    printf '%s' "$path_matches"
    echo "Maintained project-owned paths contain deprecated terminology." >&2
    exit 1
fi

if [[ -n $matches ]]; then
    printf '%s\n' "$matches"
    echo "Project-authored text contains ambiguous wording; use the terminology in CONTRIBUTING.md." >&2
    exit 1
fi

rg --quiet "只用于经过授权的学术研究" "$repo_root/README.md"
rg --quiet "隔离的仿真环境或专用实验台" "$repo_root/README.md"
rg --quiet "原始统计文件保持第三方工具的字段名称不变" "$repo_root/README.md"
rg --quiet '^# PLC Robustness Lab$' "$repo_root/README.md"
rg --quiet 'Usage: ./scripts/plc-lab' "$repo_root/scripts/plc-lab"
test -x "$repo_root/scripts/plcfuzz"

test ! -e "$repo_root/docs/archive/tmp.md"
test ! -e "$repo_root/docs/archive/一些脚本介绍.md"
test ! -e "$repo_root/docs/archive/常用的prompt.md"
test ! -e "$repo_root/docs/research/PLC代码安全的文献综述.md"

echo "PASS project wording"
