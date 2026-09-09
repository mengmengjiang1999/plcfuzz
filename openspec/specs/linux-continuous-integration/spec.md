# linux-continuous-integration Specification

## Purpose
TBD - created by archiving change add-linux-ci. Update Purpose after archive.
## Requirements
### Requirement: Authoritative Linux workflow
The repository SHALL run its maintained verification workflow on Ubuntu 22.04 for pushes to `main` and pull requests targeting `main`.

#### Scenario: Relevant revision is submitted
- **WHEN** a push or pull request targets the maintained branch
- **THEN** GitHub Actions starts the Linux quality workflow with read-only repository permissions

### Requirement: Pinned toolchain inputs
The workflow SHALL initialize the recorded MatIEC submodule commit, build it with deterministic single-job ordering, and build the recorded AFL++ `v5.03c` tag from source.

#### Scenario: A workflow run starts from a fresh checkout
- **WHEN** dependency setup completes
- **THEN** MatIEC matches the repository gitlink and AFL++ is checked out at `v5.03c`

### Requirement: Complete verification sequence
The workflow SHALL install every command used by maintained validation scripts, then run MatIEC tests, project validation scripts, ST conversion, normal runtime build, structured mapping generation, custom-mutator build, and instrumented-target build.

#### Scenario: Required validation command is unavailable
- **WHEN** a maintained validation script depends on a command not present in the base runner
- **THEN** the workflow installs that command before invoking the script

#### Scenario: Any maintained stage fails
- **WHEN** a command in the ordered verification sequence returns a failure
- **THEN** the workflow fails and later success is not reported for that revision

### Requirement: Build artifact assertions
The workflow SHALL verify that the normal runtime, mapping CSV, custom-mutator library, and instrumented target exist after their build stages.

#### Scenario: Build command exits without its expected output
- **WHEN** an expected artifact is absent
- **THEN** the workflow fails explicitly

### Requirement: Deterministic AFL++ build order
The workflow and reproducibility container SHALL build the fixed AFL++ source with one outer make job.

#### Scenario: AFL++ main and LLVM targets share a compiler output
- **WHEN** the fixed source release is built
- **THEN** the targets do not write `afl-cc` concurrently

### Requirement: Isolated instrumentation environment
The workflow SHALL use `PLCFUZZ_TOOLCHAIN_BUILD_JOBS` for fixed toolchain parallelism and `PLCFUZZ_INSTRUMENTED_CXX` for the project compiler-wrapper path.

#### Scenario: The instrumented runtime stage starts
- **WHEN** the workflow exports project build controls
- **THEN** no project-only setting occupies an upstream `AFL_` variable name

### Requirement: Unified command use in CI
Linux CI SHALL invoke maintained build and test workflows through `scripts/plcfuzz` rather than deprecated root compatibility wrappers.

#### Scenario: CI workflow structure is checked
- **WHEN** the Linux workflow is validated
- **THEN** its project build steps use canonical unified subcommands and contain no deprecated root invocation

### Requirement: Supported checkout action runtime

The authoritative Linux workflow SHALL use `actions/checkout@v5`, retain recursive submodule checkout, and keep repository permissions read-only.

#### Scenario: Workflow bootstrap runs

- **WHEN** a push or pull request starts the Linux quality workflow on the GitHub-hosted Ubuntu runner
- **THEN** repository checkout uses the action line backed by Node.js 24 without requesting write permission

#### Scenario: Workflow structure is checked

- **WHEN** the repository CI structure check reads the workflow
- **THEN** it requires `actions/checkout@v5` and rejects the deprecated v4 line

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
