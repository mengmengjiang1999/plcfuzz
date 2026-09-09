## Why

The repository runs broad build and behavior checks, but it cannot show which maintained C++ and Python paths those checks actually exercise. A versioned, project-scoped coverage contract is needed before coverage can guide additional tests without mixing MatIEC, generated PLC sources, or generated binding code into project measurements.

## What Changes

- Add a versioned coverage scope and baseline for maintained C++ and Python code.
- Instrument C++ unit tests and a normal-runtime integration run, including the runtime entry point, input application, and generated variable-map workflow.
- Collect Python tool coverage while running the maintained Python tests.
- Produce separate C++ and Python reports plus one machine-readable summary that records exclusions and baseline comparisons.
- Run coverage in Linux CI and upload the complete report directory as a build artifact.
- Start with record-and-report baseline policy; keep thresholds non-blocking until sufficient history supports deliberate increases.
- Add canonical coverage commands, validation tests, documentation, and roadmap status.

## Capabilities

### New Capabilities

- `project-code-coverage`: Defines the source boundary, collectors, integration checks, baseline policy, report schema, and validation behavior.

### Modified Capabilities

- `linux-continuous-integration`: Adds project-scoped coverage collection and report upload.
- `unified-command-entrypoint`: Adds coverage generation and validation commands.
- `improvement-roadmap`: Marks project coverage complete and leaves runtime modularization as the final pending theme.

## Impact

The change adds coverage configuration, a Linux-oriented collection script, a dependency-free report validator, integration tests, documentation, and CI artifact upload. Normal builds remain unchanged. Coverage builds use isolated output directories and explicitly remove third-party and generated paths before reporting.
