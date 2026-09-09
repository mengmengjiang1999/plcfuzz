# deterministic-input-transformer Specification

## Purpose
TBD - created by archiving change make-mutator-deterministic. Update Purpose after archive.
## Requirements
### Requirement: Seeded transformation stream
The input transformer SHALL derive every transformation decision and generated value from the `seed` supplied to `afl_custom_init`, with generator state isolated per input transformer instance.

#### Scenario: Same seed and input
- **WHEN** two input transformer instances use the same seed, mapping, and input bytes
- **THEN** their first transformed outputs are byte-identical

#### Scenario: Process-global PRNG changes
- **WHEN** unrelated code changes the libc process-global random state
- **THEN** the input transformer output for a given instance seed, mapping, and input is unchanged

### Requirement: Strict variable mapping initialization

The input transformer SHALL load a per-instance four-column variable mapping from `PLC_LAB_VARIABLE_MAPPING`, or `plc_variables_mapping.csv` when the variable is unset. The former project mapping variable SHALL remain a compatibility alias with migration guidance. A missing or malformed mapping SHALL be rejected with a diagnostic.

#### Scenario: Valid canonical mapping

- **WHEN** the canonical variable selects a mapping with a header and valid four-field rows within supported input bounds
- **THEN** initialization succeeds and transformations are limited to the mapped input locations

#### Scenario: Compatibility mapping variable

- **WHEN** only the former mapping variable selects a valid mapping
- **THEN** initialization succeeds and emits migration guidance naming `PLC_LAB_VARIABLE_MAPPING`

#### Scenario: Malformed mapping row

- **WHEN** a row has the wrong field count, invalid numeric fields, an out-of-range input location, or an empty variable name
- **THEN** initialization reports the path and row and fails

### Requirement: Defined wide-value transformations
The input transformer SHALL perform bit shifts and arithmetic transformations using width-correct unsigned IEC values.

#### Scenario: Highest wide bit selected
- **WHEN** transformation selects bit 31 of a DINT input or bit 63 of a LINT input
- **THEN** the input transformer flips that bit without a signed shift or undefined behavior

### Requirement: AFL output contract
The input transformer SHALL return serialized PLC data only when parsing succeeds and the result fits within AFL++'s `max_size`.

#### Scenario: Invalid input bytes
- **WHEN** the input does not contain complete PLC blocks
- **THEN** the input transformer returns size zero and a null output pointer

#### Scenario: Output exceeds maximum
- **WHEN** the serialized transformed data is larger than `max_size`
- **THEN** the input transformer returns size zero and a null output pointer
