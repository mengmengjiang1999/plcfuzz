## MODIFIED Requirements

### Requirement: Diagnostic custom input component build

The project SHALL provide an ASan/UBSan build of the input transformer in its own diagnostic directory.

#### Scenario: Component diagnostics are built

- **WHEN** the diagnostic build entry point runs for the input transformer
- **THEN** it produces a shared library below `build/diagnostics/input-transformer`
