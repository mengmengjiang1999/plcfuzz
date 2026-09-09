# plc-buffer-model Specification

## Purpose
TBD - created by archiving change unify-plc-buffer-size. Update Purpose after archive.
## Requirements
### Requirement: Generator-compatible runtime capacity
All linked declarations of OpenPLC I/O and memory arrays SHALL use the generator-compatible capacity of 1024 address slots.

#### Scenario: Generated glue links with runtime code
- **WHEN** generated `glueVars.cpp` defines 1024-entry I/O arrays
- **THEN** PLC Robustness Lab runtime declarations use the same array bounds

### Requirement: Compact automated-input capacity
PLC Robustness Lab input blocks SHALL model exactly eight address slots per non-Boolean type and eight bytes of Boolean bit inputs without expanding the serialized corpus format.

#### Scenario: Existing seed is parsed after capacity separation
- **WHEN** a seed contains the existing eight-slot values for each typed block
- **THEN** parsing and serialization preserve the same number and order of values

### Requirement: Distinct capacity names
Project-owned code MUST distinguish runtime I/O capacity from automated-input capacity by name.

#### Scenario: Input bounds are checked
- **WHEN** the input transformer or playback code validates a modeled input array index
- **THEN** it uses the automated-input capacity rather than the runtime I/O capacity
