## ADDED Requirements

### Requirement: Exact fixed-toolchain build caches

The Linux workflow SHALL cache MatIEC and AFL++ build trees with exact keys containing operating system, architecture, compiler version, fixed source identity, and a cache schema version.

#### Scenario: Exact MatIEC cache is restored

- **WHEN** the primary MatIEC cache key matches
- **THEN** configuration and compilation may be reused while MatIEC tests and all project validation still run

#### Scenario: Exact AFL++ cache is restored

- **WHEN** the primary AFL++ cache key matches
- **THEN** source compilation may be skipped but the compiler wrapper and reported version are still checked

#### Scenario: A key input changes

- **WHEN** a fixed source identity, compiler version, runner OS, architecture, or cache schema changes
- **THEN** the workflow uses a new cache key and performs the full source build
