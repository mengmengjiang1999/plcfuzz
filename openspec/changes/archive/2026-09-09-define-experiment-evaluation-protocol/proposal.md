## Why

Experiment manifests record how one run was launched, but the repository does not yet define comparable research questions, fixed metric semantics, controlled dimensions, or repeated-trial requirements. A versioned evaluation protocol is needed before benchmark and strategy comparisons can produce defensible aggregate conclusions.

## What Changes

- Add a documented, machine-readable evaluation protocol with seven fixed metrics and precise units, scopes, and missing-value rules.
- Require comparable trials to hold the program, target, toolchain, timing budget, input samples, and machine profile constant while varying only the declared strategy and replicate seed.
- Define a minimum repeated-trial seed set and use AFL++'s fixed-RNG-seed option for evaluation runs.
- Extend experiment manifests with protocol identity, checksum, benchmark, strategy, replicate index, and seed when evaluation mode is selected.
- Create a machine-readable evaluation-result skeleton that explicitly marks metrics as pending until a later collection or analysis step supplies evidence.
- Add protocol validation, result validation, command-line access, tests, and documentation.

## Capabilities

### New Capabilities

- `experiment-evaluation-protocol`: Defines controlled comparison groups, repeated trials, metric semantics, machine-readable protocol validation, and evaluation-result records.

### Modified Capabilities

- `experiment-run-manifest`: Records optional evaluation context and creates a linked result record without changing ordinary experiment behavior.
- `unified-command-entrypoint`: Adds an `evaluation` subcommand for validating the maintained protocol and result records.

## Impact

- Adds `evaluation/protocol-v1.json`, evaluation documentation, a Python validator, and unit tests.
- Extends the experiment launcher and manifest helper with optional evaluation variables and metadata.
- Does not yet implement benchmark programs, alternative input-generation strategies, metric collectors, or aggregate report rendering; those belong to later changes.
