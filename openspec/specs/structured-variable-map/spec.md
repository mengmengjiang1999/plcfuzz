# structured-variable-map Specification

## Purpose
TBD - created by archiving change generate-structured-variable-map. Update Purpose after archive.
## Requirements
### Requirement: Structured mapping source
The mapping generator SHALL derive runtime variable bindings from MatIEC `__LOCATED_VAR` records rather than generated C++ formatting.

#### Scenario: Supported located variable is present
- **WHEN** a record declares a supported input, output, or memory location
- **THEN** the generator emits the corresponding four-column runtime mapping row

### Requirement: Deterministic mapping output
The generator SHALL preserve source-record order and emit the established CSV header and column meanings used by the custom mutator.

#### Scenario: Reference snapshot is regenerated
- **WHEN** the tracked located-variable metadata is processed
- **THEN** the generated CSV is byte-identical to the tracked reference mapping

### Requirement: Located-variable validation
The generator SHALL reject malformed records, unsupported type and location combinations, invalid indices, inconsistent symbolic names, and duplicate runtime destinations with a path and line diagnostic.

#### Scenario: Invalid record is processed
- **WHEN** a located-variable record cannot be mapped without ambiguity
- **THEN** generation fails without writing a partial output file

#### Scenario: Destination is repeated
- **WHEN** two records identify the same runtime array and optional bit position
- **THEN** generation fails and identifies the duplicate destination

### Requirement: Build workflow integration
The maintained analysis and source-layout workflows SHALL use the MatIEC located-variable file as their mapping source.

#### Scenario: Build analysis step runs
- **WHEN** the analysis step follows ST-to-C conversion
- **THEN** it reads `plclogic/LOCATED_VARIABLES.h` and writes the root mapping CSV
