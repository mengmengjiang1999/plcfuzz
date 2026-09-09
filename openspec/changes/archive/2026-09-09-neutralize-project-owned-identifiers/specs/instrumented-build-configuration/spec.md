## MODIFIED Requirements

### Requirement: Project-owned compiler selector

The instrumented build entry point SHALL read its compiler-wrapper path from `PLC_LAB_INSTRUMENTED_CXX`, SHALL accept the former project selector as a compatibility alias with migration guidance, and SHALL NOT use `AFL_CXX` as a project setting.

#### Scenario: A fixed compiler wrapper is selected

- **WHEN** CI invokes the instrumented build with `PLC_LAB_INSTRUMENTED_CXX`
- **THEN** the wrapper can choose its real compiler without recursively selecting itself
