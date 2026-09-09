## Context

The current launcher unconditionally passes the grammar option and exports the project's AFL++ adapter library. That is appropriate for the maintained structure-aware workflow but prevents an isolated baseline comparison. The evaluation protocol already fixes metrics and seeds, and the benchmark catalog supplies stable program IDs; this change connects them without claiming that an optional feedback adapter already exists.

## Goals / Non-Goals

**Goals:**

- Give each strategy an explicit, auditable combination of grammar and adapter settings.
- Keep benchmark, duration, timeout, target, samples, machine, and seed controls equal across strategy trials.
- Generate deterministic trial IDs and complete paired-seed plans.
- Execute exactly one selected trial at a time through the existing manifest lifecycle.
- Represent unavailable optional work honestly.

**Non-Goals:**

- Run the full 225-trial core matrix in CI.
- Implement a state-feedback algorithm in this change.
- Calculate final metrics or statistical reports.
- Compare results produced on unequal builds or machines.

## Decisions

### Define three maintained modes and one adapter-required mode

`random-bytes` disables grammar and the project adapter; `protocol-valid` enables only grammar; `structure-aware` preserves the current combination of grammar, built-in operations, and the existing adapter; `state-feedback` requires an explicit adapter library in adapter-only mode. Reusing one configuration with different labels was rejected because it would not isolate the source of improvement.

### Keep structure-aware as the compatibility default

Direct `plc-lab experiment` calls without a strategy retain current behavior. Evaluation-mode calls require the evaluation strategy ID to equal the effective strategy ID. This prevents mislabeled results while avoiding a breaking change for development runs.

### Store plans as immutable control declarations

A generated JSON plan embeds protocol and strategy-registry checksums, selected benchmark source checksums, budget, target and input paths, and one trial for every benchmark/strategy/seed combination. Validation checks exact Cartesian coverage and rejects duplicate or missing pairs.

### Do not silently include unavailable state feedback

The registry marks `state-feedback` as `adapter-required`. Plan generation excludes it by default. An explicit adapter path is required to include it, and the path checksum is recorded. A placeholder run with structure-aware settings was rejected because it would produce a misleading comparison.

## Risks / Trade-offs

- [Grammar support depends on the pinned input tool] → Record the exact tool version and effective arguments in every manifest.
- [Random-byte trials may produce many invalid inputs] → This is an intended measurement captured by valid-input ratio, not an automatic failure.
- [Plans can become stale after rebuilds] → Validate all embedded checksums immediately before a trial starts.
- [Core matrix is large] → Support benchmark filtering for smoke checks while requiring complete seed pairing within every selected group.

## Migration Plan

Add the strategy selector with `structure-aware` as default, then add plan tooling and tests for all three maintained configurations. Existing direct experiment commands remain valid. Reverting the change restores unconditional structure-aware settings but makes new plan commands unavailable.

## Open Questions

The implementation and evaluation of a compatible state-feedback adapter remains future work and must receive its own review before being marked available.
