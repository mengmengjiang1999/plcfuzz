## ADDED Requirements

### Requirement: Effective input-generation strategy

Every experiment manifest SHALL record the effective strategy ID, whether grammar is enabled, whether an adapter is enabled, adapter-only mode, and applicable resource paths and checksums.

#### Scenario: Evaluation strategy label differs

- **WHEN** evaluation context names a strategy other than the effective launcher strategy
- **THEN** the experiment is rejected before its output directory is created
