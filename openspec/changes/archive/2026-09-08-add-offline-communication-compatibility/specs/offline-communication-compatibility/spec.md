## ADDED Requirements

### Requirement: Generated helper link compatibility
The ordinary runtime SHALL define every TCP helper symbol declared by the generated MatIEC standard library.

#### Scenario: A PLC input does not use communication blocks
- **WHEN** generated objects still reference the helper symbols during linking
- **THEN** the runtime links without restoring archived sources

### Requirement: Offline unavailable result
The compatibility helpers SHALL return `-1` without opening sockets or exchanging data.

#### Scenario: A generated communication block is evaluated
- **WHEN** any compatibility helper is called
- **THEN** it reports the operation as unavailable and performs no external communication
