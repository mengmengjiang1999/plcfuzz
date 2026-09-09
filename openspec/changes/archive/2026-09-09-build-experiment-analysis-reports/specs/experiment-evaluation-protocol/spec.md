## ADDED Requirements

### Requirement: Optional stable observation references

When an evaluation result includes an optional `observations` array, every entry SHALL contain a stable SHA-256 digest and a replay sample path relative to the experiment directory.

#### Scenario: Observation reference is malformed

- **WHEN** a result declares an observation digest that is not SHA-256 or a path that escapes its experiment directory
- **THEN** result or report validation fails with the observation entry
