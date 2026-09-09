# runtime-timing Specification

## Purpose
TBD - created by archiving change fix-runtime-timing. Update Purpose after archive.
## Requirements
### Requirement: Explicit automated-input timing configuration

The runtime SHALL read the cycle count from `PLC_LAB_CYCLE_COUNT` with a default of 100 and the wall-clock pacing delay from `PLC_LAB_CYCLE_DELAY_NS` with a default of zero. Former project timing variables SHALL remain compatibility aliases with migration guidance.

#### Scenario: Default fast execution

- **WHEN** neither canonical nor compatibility timing variable is set
- **THEN** the runtime executes 100 cycles without an intentional wall-clock sleep

#### Scenario: Compatibility timing variables are set

- **WHEN** only former timing variables contain valid values
- **THEN** the runtime uses those values and emits migration guidance naming the canonical variables

### Requirement: Logical and wall-clock time independence
The runtime SHALL treat MatIEC logical time as independent from optional host wall-clock pacing.

#### Scenario: Wall-clock delay disabled
- **WHEN** `PLC_LAB_CYCLE_DELAY_NS` is zero
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
