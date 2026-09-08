# plc-input-playback Specification

## Purpose
TBD - created by archiving change fix-plc-input-cycle. Update Purpose after archive.
## Requirements
### Requirement: Atomic PLC input playback
The runtime SHALL obtain one complete simulated PLC input snapshot per hardware input update, SHALL use that same snapshot for every typed input assignment in the update, and SHALL apply it only to fuzz-modeled input slots within the complete runtime buffer.

#### Scenario: One runtime update consumes one simulator step
- **WHEN** the hardware layer updates BOOL, BYTE, UINT, UDINT, ULINT, UINT memory, and UDINT memory inputs
- **THEN** every typed stream advances exactly once and all modeled-slot assignments use the returned composite snapshot

#### Scenario: Runtime has unmodeled slots
- **WHEN** the runtime buffer has more address slots than the fuzz input model
- **THEN** snapshot application stays within the modeled input capacity

### Requirement: Type-correct field routing
The runtime SHALL route each PLC input field to the corresponding OpenPLC buffer without substituting a differently sized integer field.

#### Scenario: UINT and UDINT values differ
- **WHEN** a source block contains distinct UINT and UDINT input values
- **THEN** `int_input` receives the UINT value and `dint_input` receives the UDINT value

### Requirement: Deterministic cycle transitions
Each typed simulator SHALL return a block with a positive cycle count exactly that many times before moving to the next block, and SHALL keep returning its final block after the sequence is exhausted.

#### Scenario: Two blocks with different durations
- **WHEN** a typed playback stream contains a first block with two cycles and a second block with one cycle
- **THEN** the first two snapshots contain the first block for that type and subsequent snapshots contain its second block

### Requirement: Explicit empty-state failure
The simulator MUST fail explicitly when playback is requested before any input block has been added.

#### Scenario: Read from empty simulator
- **WHEN** a caller requests the current block from an empty simulator
- **THEN** the operation raises a defined standard exception instead of indexing invalid storage
