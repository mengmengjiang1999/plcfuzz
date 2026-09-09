## ADDED Requirements

### Requirement: Thin offline runtime entry point

The executable entry source SHALL delegate to a named offline-runtime boundary and SHALL NOT directly parse input, schedule cycles, inspect state history, or format result summaries.

#### Scenario: Runtime source structure is checked

- **WHEN** the active source tree is validated
- **THEN** `src/main.cpp` contains only entry-point delegation and remains below fifty lines

### Requirement: Explicit runtime layers

Input loading/application, monotonic cycle scheduling, state observation, and result recording SHALL be implemented by separate modules with narrow headers and SHALL be orchestrated through the offline runtime.

#### Scenario: One PLC cycle executes

- **WHEN** the offline runtime advances a valid input and executes generated PLC logic
- **THEN** input application precedes logic, state observation follows logic, and timing values enter the result recorder

### Requirement: Offline adapter boundary

Inherited hardware hook functions SHALL remain available as compatibility adapters and SHALL delegate input application and state observation to the explicit runtime layers.

#### Scenario: Generated PLC code calls a hardware hook

- **WHEN** an inherited hook is invoked through the existing declaration
- **THEN** the offline adapter supplies equivalent behavior without exposing layer-owned state

### Requirement: Compatibility message modules

Compatibility message handling SHALL separate dispatch, discrete-value operations, register-value operations, and unused-buffer mapping while preserving existing public function signatures and response bytes.

#### Scenario: A supported function code is processed

- **WHEN** a valid representative request reaches `processModbusMessage`
- **THEN** dispatch selects the corresponding family handler and returns the established response length and data

#### Scenario: An unsupported function code is processed

- **WHEN** the dispatch byte does not identify a supported operation
- **THEN** the established error response is returned

### Requirement: Layer verification

The project SHALL provide unit and structural checks for layer ownership, source-size limits, explicit build membership, scheduler and recorder behavior, input application, observer lifecycle, and compatibility message dispatch.

#### Scenario: A responsibility moves back into the entry point

- **WHEN** structural validation detects parsing, history ownership, or scheduling implementation in `main.cpp`
- **THEN** project checks fail with the violated boundary
