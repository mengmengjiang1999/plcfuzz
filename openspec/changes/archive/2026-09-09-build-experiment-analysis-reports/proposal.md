## Why

Evaluation runs now produce versioned manifests and metric records, but researchers must still inspect directories manually and cannot obtain a consistent multi-run summary. Automated, validation-first reporting is needed to preserve failures and missing data while producing directly reviewable tables, charts, and replay links.

## What Changes

- Add a report generator that recursively discovers evaluation runs and validates each manifest, protocol link, and result record.
- Group complete numeric metrics by benchmark and strategy, then calculate count, mean, median, sample standard deviation, minimum, maximum, and deterministic bootstrap 95% intervals.
- Deduplicate optional retained observations by stable digest while preserving every source run and replay path.
- Emit one report bundle containing JSON, CSV, static SVG charts, failure records, missing-data records, and an observation index.
- Reject non-empty output directories and use atomic writes so partial reports are not mistaken for complete reports.
- Add canonical report commands, tests, and documentation.

## Capabilities

### New Capabilities

- `experiment-analysis-reports`: Defines validated run discovery, aggregation, stable-digest deduplication, output formats, and traceability.

### Modified Capabilities

- `experiment-evaluation-protocol`: Allows evaluation result records to carry optional stable observation references for report indexing.
- `unified-command-entrypoint`: Adds experiment-report generation and validation commands.

## Impact

The change adds a dependency-free Python report tool, report schema, tests, documentation, and command wiring. It reads existing experiment directories without modifying them and writes only to a new report directory selected by the user.
