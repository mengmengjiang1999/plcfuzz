#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
platform=${PLCFUZZ_CONTAINER_PLATFORM:-linux/amd64}
image_tag=${PLCFUZZ_CONTAINER_TAG:-plcfuzz:repro}
output_dir=${PLCFUZZ_CONTAINER_REPORT_DIR:-"$repo_root/output/linux-container-acceptance"}
base_image='public.ecr.aws/ubuntu/ubuntu:22.04@sha256:23bda685bd84a4d3b9caf2086a4c35f368bb7acd57ef38090b7a45ac92216ccf'
internal_report="$output_dir/internal-report.json"
combined_report="$output_dir/manifest.json"

mkdir -p "$output_dir"

source_revision=$(git -C "$repo_root" rev-parse HEAD)
matiec_revision=$(git -C "$repo_root" rev-parse HEAD:third_party/matiec)

docker build \
    --platform "$platform" \
    --build-arg "SOURCE_REVISION=$source_revision" \
    --build-arg "MATIEC_REVISION=$matiec_revision" \
    -f "$repo_root/Dockerfile.repro" \
    -t "$image_tag" \
    "$repo_root"
docker run --rm --platform "$platform" --entrypoint cat "$image_tag" \
    /opt/plcfuzz-acceptance/report.json >"$internal_report"

base_image_id=$(docker image inspect --format '{{.Id}}' "$base_image")
final_image_digest=$(docker image inspect --format '{{.Id}}' "$image_tag")

python3 "$repo_root/scripts/write_linux_acceptance_report.py" combine \
    --internal-report "$internal_report" \
    --output "$combined_report" \
    --platform "$platform" \
    --image-tag "$image_tag" \
    --base-image-id "$base_image_id" \
    --final-image-digest "$final_image_digest"

echo "Linux container acceptance manifest: $combined_report"
