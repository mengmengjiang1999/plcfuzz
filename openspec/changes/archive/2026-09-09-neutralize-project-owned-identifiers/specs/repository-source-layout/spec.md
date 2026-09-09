## MODIFIED Requirements

### Requirement: Isolated historical implementations

Disabled protocol implementations and obsolete input-transformer or grammar variants SHALL reside under a documented archival tree, outside `src/` and the maintained `input_generation/` directory.

#### Scenario: Maintainer inspects active directories

- **WHEN** the maintainer lists `src/` and `input_generation/`
- **THEN** fully disabled implementations and backup-named variants are absent
