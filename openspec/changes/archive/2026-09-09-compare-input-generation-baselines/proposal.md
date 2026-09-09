## Why

The project has an evaluation protocol and a balanced benchmark suite, but its launcher always enables the same grammar and input transformer, so it cannot answer whether structural information improves measured outcomes. Explicit strategy isolation and a controlled trial matrix are required before results can support a research comparison.

## What Changes

- Define a versioned strategy registry for byte-level random, protocol-valid, structure-aware, and optional state-feedback input generation.
- Make the experiment launcher configure grammar and project adapters only for the selected strategy and record the effective strategy configuration.
- Generate a machine-readable comparison plan that crosses selected benchmarks, available strategies, and all fixed protocol seeds under one declared budget.
- Validate equal controls and complete paired seed coverage before a plan can be executed.
- Provide a canonical command to create, validate, and run one plan trial without silently substituting an unavailable optional adapter.
- Document the interpretation boundary and commands for controlled comparison.

## Capabilities

### New Capabilities

- `input-generation-baseline-comparison`: Defines strategy isolation, availability, balanced trial planning, and controlled execution.

### Modified Capabilities

- `experiment-run-manifest`: Records the selected input-generation strategy and its effective grammar/adapter configuration.
- `unified-command-entrypoint`: Adds comparison-plan generation, validation, and single-trial execution.

## Impact

This changes the experiment launcher's strategy configuration while preserving `structure-aware` as the default for existing commands. It adds a strategy registry, comparison planner, validator, tests, and documentation. The optional state-feedback entry requires an explicitly supplied compatible adapter and is never represented as available by default.
