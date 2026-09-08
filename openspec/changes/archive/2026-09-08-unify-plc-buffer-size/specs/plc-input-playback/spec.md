## MODIFIED Requirements

### Requirement: Atomic PLC input playback
The runtime SHALL obtain one complete simulated PLC input snapshot per hardware input update, SHALL use that same snapshot for every typed input assignment in the update, and SHALL apply it only to fuzz-modeled input slots within the complete runtime buffer.

#### Scenario: One runtime update consumes one simulator step
- **WHEN** the hardware layer updates BOOL, BYTE, UINT, UDINT, ULINT, UINT memory, and UDINT memory inputs
- **THEN** every typed stream advances exactly once and all modeled-slot assignments use the returned composite snapshot

#### Scenario: Runtime has unmodeled slots
- **WHEN** the runtime buffer has more address slots than the fuzz input model
- **THEN** snapshot application stays within the modeled input capacity
