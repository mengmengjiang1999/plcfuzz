## ADDED Requirements

### Requirement: Deterministic AFL++ build order
The workflow and reproducibility container SHALL build the fixed AFL++ source with one outer make job.

#### Scenario: AFL++ main and LLVM targets share a compiler output
- **WHEN** the fixed source release is built
- **THEN** the targets do not write `afl-cc` concurrently
