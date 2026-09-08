# deterministic-plc-mutator Specification

## Purpose
TBD - created by archiving change make-mutator-deterministic. Update Purpose after archive.
## Requirements
### Requirement: Seeded mutation stream
The custom mutator SHALL derive every mutation decision and generated value from the `seed` supplied to `afl_custom_init`, with generator state isolated per mutator instance.

#### Scenario: Same seed and input
- **WHEN** two mutator instances use the same seed, mapping, and input bytes
- **THEN** their first mutation outputs are byte-identical

#### Scenario: Process-global PRNG changes
- **WHEN** unrelated code changes the libc process-global random state
- **THEN** the custom mutator output for a given instance seed, mapping, and input is unchanged

### Requirement: Strict variable mapping initialization
The custom mutator SHALL load a per-instance four-column variable mapping from `PLCFUZZ_VARIABLE_MAPPING`, or `plc_variables_mapping.csv` when the variable is unset, and SHALL reject a missing or malformed mapping with a diagnostic.

#### Scenario: Valid mapping
- **WHEN** the selected mapping contains a header and valid four-field rows within supported input bounds
- **THEN** initialization succeeds and mutations are limited to the mapped input locations

#### Scenario: Missing mapping
- **WHEN** the selected mapping file cannot be opened
- **THEN** initialization reports the path and fails without allowing a C++ exception to cross the AFL++ C ABI

#### Scenario: Malformed mapping row
- **WHEN** a row has the wrong field count, invalid numeric fields, an out-of-range input location, or an empty variable name
- **THEN** initialization reports the path and row and fails

### Requirement: Defined wide-value mutations
The custom mutator SHALL perform bit shifts and arithmetic mutations using width-correct unsigned IEC values.

#### Scenario: Highest wide bit selected
- **WHEN** mutation selects bit 31 of a DINT input or bit 63 of a LINT input
- **THEN** the mutator flips that bit without a signed shift or undefined behavior

### Requirement: AFL output contract
The custom mutator SHALL return serialized PLC data only when parsing succeeds and the result fits within AFL++'s `max_size`.

#### Scenario: Invalid input bytes
- **WHEN** the input does not contain complete PLC blocks
- **THEN** the mutator returns size zero and a null output pointer

#### Scenario: Output exceeds maximum
- **WHEN** the serialized mutation is larger than `max_size`
- **THEN** the mutator returns size zero and a null output pointer
