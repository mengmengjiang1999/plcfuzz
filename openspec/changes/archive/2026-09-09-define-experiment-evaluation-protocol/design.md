## Context

The experiment manifest captures revisions, paths, timing, machine details, and the executed command for an individual run. It does not say which runs are intended to be compared, which dimensions must match, how metrics are calculated, or how many repeated trials are required. The next roadmap items need a stable contract for benchmark identifiers, strategy identifiers, replicate seeds, and result records.

## Goals / Non-Goals

**Goals:**

- Define one versioned protocol that is both human-readable and machine validated.
- Make every metric unambiguous about unit, scope, direction, and missing values.
- Ensure evaluation runs use a declared fixed seed and carry enough identity to form controlled comparison groups.
- Represent unavailable measurements honestly rather than inventing zero values.

**Non-Goals:**

- Add benchmark ST programs or strategy implementations.
- Collect coverage, state transitions, or replay outcomes in this change.
- Produce statistical charts or publication tables.
- Require evaluation metadata for ordinary development experiments.

## Decisions

### Separate trial and aggregate metrics

Six metrics describe an individual trial: valid-input ratio, path-coverage change, unique PLC state transitions, unique observations, time to first observation, and replay-success ratio. Replicate variability is an aggregate metric computed across matched trials. The protocol records scope so a trial result cannot pretend to contain an aggregate value.

### Use five declared fixed seeds as the minimum set

The maintained protocol declares five unique unsigned seeds. Evaluation runs identify a zero-based replicate index and its matching seed. The launcher passes the seed through AFL++'s documented `-s` option, making the outer tool and the input transformer share a reproducible starting point.

### Define comparison controls explicitly

Runs belong to the same comparison group only when benchmark and program identity, target and input artifacts, repository and MatIEC revisions, tool version, duration, timeout, runtime timing, and machine fingerprint match. Strategy ID and replicate seed are the intended varying dimensions.

### Create result skeletons with explicit availability

An evaluation-mode run creates `evaluation-result.json` beside `manifest.json`. Each trial metric starts with `value: null`, `status: pending`, and a reason. Later collectors replace pending entries with measured values and evidence references. Aggregate-only metrics are declared but omitted from trial values.

### Keep evaluation mode opt-in

Ordinary `plc-lab experiment` runs remain valid without protocol metadata. If any evaluation variable is provided, all required dimensions must be present and validated together; partial context is rejected.

## Risks / Trade-offs

- Five repeats are a minimum rather than a universal statistical guarantee. The protocol records the rule and can be versioned when a study needs more.
- Machine fingerprints can be overly strict across nominally equivalent hosts. Exact grouping favors reproducibility; later reporting may define an explicitly normalized profile.
- Initial result files contain pending values. This is deliberate provenance, and result validation rejects missing metric entries or values without evidence.
