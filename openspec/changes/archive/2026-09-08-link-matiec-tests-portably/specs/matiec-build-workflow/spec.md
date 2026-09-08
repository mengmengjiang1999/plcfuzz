## ADDED Requirements

### Requirement: Portable test archive resolution
The MatIEC setup entry point SHALL append the compiler library to test link commands through an absolute `LIBS` value.

#### Scenario: Tests link with left-to-right static archive resolution
- **WHEN** an earlier compiler archive scan precedes a later archive that references `error_exit`
- **THEN** the trailing compiler library resolves the reference without skipping tests
