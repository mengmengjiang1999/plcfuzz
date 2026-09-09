## Context

An evaluation run consists of `manifest.json` plus `evaluation-result.json`. Metric entries can be complete, pending, or unavailable, and failed runs remain useful evidence. There is no current aggregate schema, and existing historical statistics do not use the new evaluation contract. The report tool must therefore be explicit about which directories are included and why a value is absent.

## Goals / Non-Goals

**Goals:**

- Discover and validate all versioned evaluation runs below one input root.
- Preserve failed runs and missing metrics as first-class report records.
- Produce deterministic aggregate values and file ordering.
- Deduplicate retained observations using declared stable SHA-256 digests.
- Emit JSON, CSV, and dependency-free static SVG charts with paths back to evidence.

**Non-Goals:**

- Infer new metric values from raw third-party statistics.
- Merge runs from incompatible protocol versions or comparison controls.
- Hide incomplete runs to improve reported values.
- Provide an interactive web dashboard.

## Decisions

### Use evaluation-result files as discovery anchors

The generator searches recursively for `evaluation-result.json`, then follows its manifest and protocol links. A loose scan of every JSON file was rejected because historical directories contain unrelated schemas.

### Separate aggregates, failures, and missing data

Only complete finite numeric metrics enter aggregates. Every non-success run enters `failed_runs`, and every pending/unavailable metric enters `missing_metrics` with status and reason. Zero is retained only when explicitly recorded as a complete value.

### Use deterministic bootstrap intervals

For each benchmark/strategy/metric group, calculate mean, median, sample standard deviation, min, and max. A percentile bootstrap interval uses a seed derived from the group key and a fixed resample count, making byte-for-byte report regeneration possible. Groups with one value receive a zero-width interval and null sample deviation.

### Index observations by stable digest

An optional result-level `observations` array contains a SHA-256 stable digest and a replay sample path relative to the run directory. The report merges matching digests but retains every source path and run. Missing files are reported as missing data rather than silently discarded.

### Produce a new immutable bundle

The output directory must be absent or empty. Files are written atomically, and `report.json` contains a schema, input root, deterministic report content, and artifact names. Timestamps are excluded so identical input trees generate identical content.

## Risks / Trade-offs

- [Historical results lack evaluation records] → Ignore them with an explicit discovery count; do not reinterpret incompatible formats.
- [Small groups yield unstable intervals] → Always expose sample count and retain raw values in JSON.
- [SVG labels may become crowded] → Create one compact chart per metric and include full values in CSV/JSON.
- [Observation digests may be declared incorrectly] → Validate hexadecimal form and sample existence; later replay automation can confirm behavior.

## Migration Plan

Add reporting as a read-only optional command. Existing experiment directories remain unchanged. A report bundle can be deleted and regenerated because its content is derived. Reverting removes only the reporting command and schema.

## Open Questions

None. Runtime collection of metric evidence remains separate from aggregation.
