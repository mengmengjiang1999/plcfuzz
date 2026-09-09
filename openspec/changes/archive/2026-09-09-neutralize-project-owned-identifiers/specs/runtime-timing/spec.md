## MODIFIED Requirements

### Requirement: Explicit automated-input timing configuration

The runtime SHALL read the cycle count from `PLC_LAB_CYCLE_COUNT` with a default of 100 and the wall-clock pacing delay from `PLC_LAB_CYCLE_DELAY_NS` with a default of zero. Former project timing variables SHALL remain compatibility aliases with migration guidance.

#### Scenario: Default fast execution

- **WHEN** neither canonical nor compatibility timing variable is set
- **THEN** the runtime executes 100 cycles without an intentional wall-clock sleep

#### Scenario: Compatibility timing variables are set

- **WHEN** only former timing variables contain valid values
- **THEN** the runtime uses those values and emits migration guidance naming the canonical variables
