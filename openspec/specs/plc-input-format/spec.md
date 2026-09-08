# plc-input-format Specification

## Purpose
TBD - created by archiving change version-plc-input-format. Update Purpose after archive.
## Requirements
### Requirement: Canonical versioned representation
The project SHALL serialize automated PLC input data as UTF-8-compatible ASCII text beginning with the exact header `PLCFUZZ_INPUT_V1`, followed by one or more fixed-layout records containing 119 unsigned decimal fields each.

#### Scenario: One record is serialized
- **WHEN** a caller serializes one valid PLC input record
- **THEN** the output begins with the V1 header, contains exactly one 119-field record, and ends with a newline

#### Scenario: Multiple records are serialized
- **WHEN** a caller serializes multiple records
- **THEN** each record follows the same field order and the shared parser reconstructs every value

### Requirement: Shared strict parser
The runtime and custom mutator SHALL use one shared parser that accepts only complete records, non-negative decimal integers, supported cycle counts, and values representable by their destination IEC types.

#### Scenario: Incomplete record is provided
- **WHEN** the input ends before all 119 fields of a record are present
- **THEN** parsing fails without retaining a partial record

#### Scenario: Field is outside its represented range
- **WHEN** a numeric field exceeds the range of its destination type
- **THEN** parsing fails rather than truncating the value

#### Scenario: Extra non-record data is provided
- **WHEN** non-whitespace data remains after the last complete record
- **THEN** parsing fails

### Requirement: Explicit version handling
The shared parser SHALL report whether accepted input uses V1 or the unversioned legacy layout and SHALL reject an unrecognized `PLCFUZZ_INPUT_` version header.

#### Scenario: V1 input is provided
- **WHEN** the first token is `PLCFUZZ_INPUT_V1`
- **THEN** parsing succeeds as V1 when at least one complete record follows

#### Scenario: Preserved unversioned input is provided
- **WHEN** the first token is a decimal cycle count and complete records follow
- **THEN** parsing succeeds in legacy compatibility mode

#### Scenario: Unknown version is provided
- **WHEN** the first token is another `PLCFUZZ_INPUT_` identifier
- **THEN** parsing fails explicitly instead of treating the identifier as record data

### Requirement: Canonical generation sources
The active grammar and custom mutator SHALL generate the canonical V1 representation, while preserved unversioned seeds and historical data SHALL remain unchanged.

#### Scenario: Grammar generates an input
- **WHEN** AFL++ uses the active PLC grammar
- **THEN** the generated input starts with the V1 header and follows the documented record order

#### Scenario: Legacy seed is mutated
- **WHEN** the custom mutator receives a valid unversioned seed
- **THEN** it accepts the seed and emits canonical V1 output
