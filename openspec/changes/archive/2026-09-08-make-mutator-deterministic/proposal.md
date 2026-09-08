## Why

The AFL++ custom mutator stores AFL's seed but performs mutations through the process-global `random()` state, so a recorded seed does not reproduce an output. Its mapping loader also accepts incomplete data implicitly and its 32/64-bit signed shift expressions can invoke undefined behavior.

## What Changes

- Route every mutation decision and generated value through the per-instance seeded generator.
- Use width-correct unsigned bit masks and explicit modular arithmetic for IEC unsigned values.
- Load variable mappings into each mutator instance with strict CSV validation and a clear initialization failure.
- Remove unused seed-cache and mutation-selection paths.
- Add integration tests proving same-seed reproducibility, different-seed variation, malformed-map rejection, and output-size handling.

## Capabilities

### New Capabilities

- `deterministic-plc-mutator`: Defines seeded custom-mutator behavior, mapping validation, and safe mutation boundaries.

### Modified Capabilities

None.

## Impact

The custom mutator implementation, its helper code, unit-test runner, and reproducibility documentation are affected. AFL++'s custom mutator ABI and serialized PLC input format remain unchanged.
