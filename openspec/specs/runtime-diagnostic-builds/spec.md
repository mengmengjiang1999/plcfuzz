# runtime-diagnostic-builds Specification

## Purpose
TBD - created by archiving change add-runtime-diagnostics. Update Purpose after archive.
## Requirements
### Requirement: Isolated diagnostic runtime build
The project SHALL provide an ordinary runtime build with ASan and UBSan compile and link flags in a directory separate from normal and instrumented objects.

#### Scenario: Runtime diagnostics are built
- **WHEN** the diagnostic build entry point runs for the runtime
- **THEN** it produces `build/diagnostics/runtime/openplc_diagnostic` without replacing `openplc`

### Requirement: Diagnostic custom input component build
The project SHALL provide an ASan/UBSan build of the custom input component in its own diagnostic directory.

#### Scenario: Component diagnostics are built
- **WHEN** the diagnostic build entry point runs for the custom input component
- **THEN** it produces a shared library below `build/diagnostics/mutator`
