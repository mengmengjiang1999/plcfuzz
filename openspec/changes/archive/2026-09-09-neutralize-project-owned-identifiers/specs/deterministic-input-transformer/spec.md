## MODIFIED Requirements

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
