## ADDED Requirements

### Requirement: Clean build preparation
The MatIEC setup entry point SHALL create the generated stage-four dependency directory after configuration and before compilation.

#### Scenario: Fresh checkout has no generated dependency directories
- **WHEN** the setup entry point configures MatIEC from a clean source tree
- **THEN** `stage4/.deps` exists before `make` starts
