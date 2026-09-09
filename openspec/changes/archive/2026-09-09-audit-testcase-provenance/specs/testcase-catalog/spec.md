## MODIFIED Requirements

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
