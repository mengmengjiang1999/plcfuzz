## ADDED Requirements

### Requirement: Explicit fuzz-loop timing configuration
The runtime SHALL read the cycle count from `PLCFUZZ_CYCLE_COUNT` with a default of 100 and the wall-clock pacing delay in nanoseconds from `PLCFUZZ_CYCLE_DELAY_NS` with a default of zero.

#### Scenario: Default fast fuzz execution
- **WHEN** neither timing environment variable is set
- **THEN** the runtime executes 100 cycles without an intentional wall-clock sleep

#### Scenario: Valid timing overrides
- **WHEN** the environment contains a positive cycle count and a non-negative nanosecond delay
- **THEN** the runtime uses those values for the current input execution

#### Scenario: Invalid timing override
- **WHEN** a timing environment variable is malformed, out of range, or violates its allowed range
- **THEN** the runtime fails startup with a configuration error

### Requirement: Logical and wall-clock time independence
The runtime SHALL treat MatIEC logical time as independent from optional host wall-clock pacing.

#### Scenario: Wall-clock delay disabled
- **WHEN** `PLCFUZZ_CYCLE_DELAY_NS` is zero
- **THEN** PLC logical time continues to advance through the existing MatIEC runtime behavior while no host sleep is requested

### Requirement: Correct timing statistics
The runtime SHALL calculate cycle duration and wake-up latency statistics from the actual recorded samples, including total, minimum, maximum, average, and count.

#### Scenario: Multiple timing samples
- **WHEN** multiple duration or latency samples are recorded
- **THEN** the reported extrema describe individual samples and the average equals the accumulated total divided by the sample count

#### Scenario: Unpaced execution
- **WHEN** wall-clock pacing is disabled
- **THEN** each recorded wake-up latency is zero

### Requirement: Absolute paced scheduling
When wall-clock pacing is enabled, the runtime SHALL advance an absolute monotonic deadline by the configured delay and report non-negative wake-up lateness relative to that deadline.

#### Scenario: Paced cycle wakes late
- **WHEN** the host wakes after the absolute cycle deadline
- **THEN** the recorded latency equals the elapsed nanoseconds after that deadline
