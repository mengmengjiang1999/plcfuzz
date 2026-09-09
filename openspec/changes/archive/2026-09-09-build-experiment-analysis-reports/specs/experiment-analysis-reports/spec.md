## ADDED Requirements

### Requirement: Validated evaluation discovery

The report generator SHALL recursively discover evaluation-result records, validate their manifests and protocols, and reject incompatible schema or identity links.

#### Scenario: Result links the wrong protocol

- **WHEN** an evaluation result protocol identity or checksum differs from its linked manifest
- **THEN** report generation fails with the affected run path

### Requirement: Explicit aggregate statistics

For every benchmark, strategy, and trial-metric group, the report SHALL preserve raw complete values and calculate count, mean, median, sample standard deviation, minimum, maximum, and a deterministic bootstrap-percentile 95% interval.

#### Scenario: Metric is missing

- **WHEN** a metric is pending or unavailable
- **THEN** it is excluded from numeric aggregation and included in the missing-data list with status and reason

### Requirement: Failure preservation

The report SHALL list every discovered run whose final status is not success, including its manifest path, status, and exit code.

#### Scenario: One trial has a nonzero outcome

- **WHEN** a comparison group contains successful and non-successful runs
- **THEN** complete values remain aggregatable and the non-successful run remains visible in the failure list

### Requirement: Stable observation index

The report SHALL deduplicate declared observations by stable SHA-256 digest while preserving all source runs and existing replay sample paths.

#### Scenario: Digest appears in multiple runs

- **WHEN** two valid results declare the same stable digest
- **THEN** the report contains one observation entry with both source references

### Requirement: Multi-format immutable bundle

The generator SHALL write deterministic JSON, CSV, and per-metric static SVG charts to an absent or empty output directory using atomic replacement.

#### Scenario: Output directory contains files

- **WHEN** generation targets a non-empty directory
- **THEN** it fails before replacing any existing report artifact

### Requirement: Report validation

The project SHALL provide a command that validates report schema, cross-file CSV rows, chart inventory, aggregate arithmetic, and referenced replay paths.

#### Scenario: Report artifact is missing

- **WHEN** a chart or CSV declared by `report.json` is absent
- **THEN** report validation fails with the artifact path
