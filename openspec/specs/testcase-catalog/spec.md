# testcase-catalog Specification

## Purpose
TBD - created by archiving change catalog-test-corpus. Update Purpose after archive.
## Requirements
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
### Requirement: Explicit testcase metadata
Each manifest entry SHALL record current path, original path, language, collection, compiler profile, expected result, resolved origin, SPDX license identifier, and research purpose using documented values.

#### Scenario: A catalog row is inspected
- **WHEN** a contributor selects any tracked ST or LD file
- **THEN** its row contains no unresolved origin or license placeholder

#### Scenario: Archived case is cataloged
- **WHEN** a testcase is below `testcases/archive/incompatible-matiec/`
- **THEN** its original pre-archive path and expected MatIEC result are recorded

### Requirement: Catalog validation
The project SHALL provide a dependency-free validation entry point that checks schema values, sorted uniqueness, full Git file coverage, provenance-registry joins, external-file source mappings, and origin/license consistency by default and can optionally verify all ST expectations with the pinned MatIEC compiler.

#### Scenario: Default validation runs
- **WHEN** a contributor runs the catalog checker without optional compiler verification
- **THEN** it validates schema, paths, extensions, allowed values, full tree coverage, provenance evidence, and external source mappings

#### Scenario: Compiler verification runs
- **WHEN** compiler verification is requested and the pinned MatIEC is available
- **THEN** every ST entry is checked with its declared profile and the observed acceptance result must match the manifest

#### Scenario: Provenance metadata is inconsistent
- **WHEN** a catalog origin has no evidence row or an external file has no source mapping
- **THEN** validation fails with the affected record

### Requirement: Existing validation integration
The maintained testcase validation workflow SHALL check catalog consistency before compiling the focused MatIEC compatibility suite.

#### Scenario: Focused testcase validation runs
- **WHEN** `scripts/validate_testcases.sh` is executed
- **THEN** manifest inconsistency stops the workflow before individual cases are compiled
