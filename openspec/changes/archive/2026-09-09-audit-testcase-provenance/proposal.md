## Why

The testcase catalog currently marks most historical ST and all LD material as requiring review. Repository history identifies when those files entered PLCFuzz, but it does not record the original external collection, fixed source revision, applicable license, local modification status, or redistribution conditions.

## What Changes

- Identify the 31 LD files as LDmicro material at a fixed upstream revision and record the upstream path for each file.
- Identify two archived ST conversions as LDmicro-derived material and classify the remaining repository-authored ST cases separately.
- Replace every `to-review` catalog value with a supported origin and SPDX identifier backed by a machine-readable provenance registry.
- Validate that every catalog origin has an evidence record, every external file has an upstream mapping, and redistribution guidance remains explicit.
- Document retained notices and the fact that several local LD files differ from the fixed upstream snapshot.

## Capabilities

### New Capabilities

- `testcase-provenance`: Verifiable source, license, and redistribution metadata for all tracked test material.

### Modified Capabilities

- `testcase-catalog`: Require resolved origin/license values and cross-check them against provenance evidence.

## Impact

- Changes only metadata, documentation, and validation; testcase program content is preserved.
- Makes clear which files are project-authored, copied from LDmicro, or derived from LDmicro.
- Records GPL obligations for redistributed LDmicro material without treating locally modified files as byte-identical upstream copies.
