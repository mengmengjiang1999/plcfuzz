# testcase-catalog Specification

## Purpose
TBD - created by archiving change catalog-test-corpus. Update Purpose after archive.
## Requirements
### Requirement: Complete testcase inventory
The repository SHALL maintain a machine-readable manifest with exactly one entry for every tracked `.st` and `.ld` file below `testcases/`.

#### Scenario: Testcase is added or removed
- **WHEN** the tracked testcase tree and manifest paths no longer match
- **THEN** the catalog validation reports the path difference and fails

#### Scenario: Manifest contains duplicate paths
- **WHEN** two manifest rows identify the same current path
- **THEN** catalog validation fails

### Requirement: Explicit testcase metadata
Each manifest entry SHALL record current path, original path, language, collection, compiler profile, expected result, origin status, license status, and research purpose using documented values.

#### Scenario: Metadata is not yet established
- **WHEN** origin or license details have not been verified
- **THEN** the entry uses an explicit review-needed value rather than an inferred claim or empty field

#### Scenario: Archived case is cataloged
- **WHEN** a testcase is below `testcases/archive/incompatible-matiec/`
- **THEN** its original pre-archive path and expected MatIEC result are recorded

### Requirement: Catalog validation
The project SHALL provide a dependency-free validation entry point that checks manifest structure by default and can optionally verify ST expectations with the pinned MatIEC compiler.

#### Scenario: Default validation runs
- **WHEN** a contributor runs the catalog checker without optional compiler verification
- **THEN** it validates schema, paths, extensions, allowed values, and full tree coverage

#### Scenario: Compiler verification runs
- **WHEN** compiler verification is requested and the pinned MatIEC is available
- **THEN** every ST entry is checked with its declared profile and the observed acceptance result must match the manifest

### Requirement: Existing validation integration
The maintained testcase validation workflow SHALL check catalog consistency before compiling the focused MatIEC compatibility suite.

#### Scenario: Focused testcase validation runs
- **WHEN** `scripts/validate_testcases.sh` is executed
- **THEN** manifest inconsistency stops the workflow before individual cases are compiled
