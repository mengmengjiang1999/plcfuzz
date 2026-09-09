## MODIFIED Requirements

### Requirement: Complete testcase inventory
The repository SHALL maintain a machine-readable manifest with exactly one entry for every tracked `.st` and `.ld` file below `testcases/`, including every ST source selected by the representative benchmark catalog.

#### Scenario: Testcase is added or removed
- **WHEN** the tracked testcase tree and manifest paths no longer match
- **THEN** the catalog validation reports the path difference and fails

#### Scenario: Manifest contains duplicate paths
- **WHEN** two manifest rows identify the same current path
- **THEN** catalog validation fails

#### Scenario: Benchmark source is not cataloged
- **WHEN** a benchmark references an ST source without a matching testcase-catalog row
- **THEN** benchmark validation fails with the source path
