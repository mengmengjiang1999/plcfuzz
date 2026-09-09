## Why

Project-authored sources, tests, scripts, build definitions, and documentation currently rely on the repository-level GPL text without machine-readable file attribution. Third-party files already carry several distinct notices, so automated checks need an explicit boundary that adds project metadata without replacing upstream terms.

## What Changes

- Add REUSE-compatible metadata for clearly identified project-authored file groups using `GPL-3.0-only` and a contributor attribution.
- Add an automated checker that confirms the metadata schema, license identifier, tracked-path coverage, and preservation of known third-party headers.
- Document which paths are project-authored, third-party, generated, historical, or awaiting the separate provenance review.
- Keep the top-level `LICENSE` as the complete GPL version 3 text and explain how it relates to the SPDX identifier.

## Capabilities

### New Capabilities

- `project-license-metadata`: Machine-readable copyright and license coverage for project-authored files.

## Impact

- Adds repository metadata and a validation script without changing runtime behavior.
- Makes original-project licensing auditable while preserving third-party notices and deferring uncertain test-material decisions to `audit-testcase-provenance`.
