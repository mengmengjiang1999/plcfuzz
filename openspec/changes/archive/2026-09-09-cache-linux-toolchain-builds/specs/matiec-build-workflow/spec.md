## ADDED Requirements

### Requirement: Explicit prebuilt MatIEC mode

The MatIEC setup script SHALL reuse a prebuilt source tree only when explicitly requested and when the compiler, generated Makefile, and compiler support library are present.

#### Scenario: Complete prebuilt tree is selected

- **WHEN** explicit prebuilt mode is enabled and all required build outputs exist
- **THEN** setup skips configuration and compilation

#### Scenario: MatIEC tests are requested with a prebuilt tree

- **WHEN** test mode and prebuilt mode are enabled together
- **THEN** prior Automake result files are discarded and the complete MatIEC test command runs again

#### Scenario: Prebuilt outputs are incomplete

- **WHEN** explicit prebuilt mode is enabled but a required output is absent
- **THEN** setup follows the normal source-build path before running tests
