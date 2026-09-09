## ADDED Requirements

### Requirement: Test material provenance registry
The repository SHALL maintain a machine-readable registry that records each testcase origin class, fixed source location and revision, SPDX license identifier, redistribution status, and supporting evidence.

#### Scenario: An external testcase is reviewed
- **WHEN** its catalog origin is joined with the provenance registry
- **THEN** the upstream repository, fixed revision, license, and redistribution conditions are available without network access

### Requirement: External file mapping
Every LDmicro-origin LD file SHALL have a machine-readable mapping to its upstream path and blob identifier with an explicit normalized-equivalent or modified status.

#### Scenario: A locally modified LD file is inspected
- **WHEN** its source mapping is read
- **THEN** the file remains attributed to LDmicro but is not represented as byte-identical to upstream

### Requirement: Redistribution guidance
The repository SHALL document the notices and license materials that accompany redistributed third-party test material.

#### Scenario: A source archive is prepared
- **WHEN** LDmicro test material is included
- **THEN** the GPL version 3 text, origin mapping, modification status, and upstream attribution are retained
