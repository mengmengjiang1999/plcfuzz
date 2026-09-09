# runtime-resource-ownership Specification

## Purpose
TBD - created by archiving change strengthen-runtime-ownership. Update Purpose after archive.
## Requirements
### Requirement: Fallback runtime values have explicit stable ownership

The runtime SHALL own fallback values in a zero-initialized process-lifetime object and SHALL attach fallback addresses only to null entries in generated pointer arrays.

#### Scenario: Existing generated mapping is preserved

- **WHEN** fallback storage is attached to a pointer table containing a non-null generated mapping
- **THEN** that pointer remains unchanged while missing entries receive stable fallback addresses

### Requirement: Input addresses are bounded value types

The runtime SHALL represent modeled input slots and bit offsets with value types that reject values outside their protocol ranges.

#### Scenario: Out-of-range address is rejected

- **WHEN** a caller constructs an input slot at `PLC_INPUT_SIZE` or a bit offset at `8`
- **THEN** construction fails with an out-of-range error

### Requirement: Input application is atomic for incomplete mappings

The runtime SHALL validate all required input destinations before applying a block and SHALL return a failure result without writing any destination when a required pointer is missing.

#### Scenario: Missing destination prevents partial update

- **WHEN** one required destination pointer is null
- **THEN** input application returns `false` and all other destination values remain unchanged

### Requirement: History sampling requires complete pointer tables

History sampling SHALL validate all source pointers before copying values and SHALL leave its sample count unchanged when validation fails.

#### Scenario: Missing history source is refused

- **WHEN** a history source table contains a null pointer
- **THEN** sampling returns `false` and does not advance chronology

### Requirement: Hardware mutex ownership follows lexical scope

Hardware buffer updates SHALL use a non-copyable scope-bound guard that releases the mutex when control leaves the guarded scope.

#### Scenario: Guard leaves a scope

- **WHEN** a mutex guard is destroyed after acquiring a mutex
- **THEN** the mutex can be acquired again by the caller
