## Context

The ordinary runtime and custom input component are compiled through different build systems, so diagnostics must be enabled at both compile and link time without mixing their objects with normal outputs. Sample organization must distinguish signal termination from ordinary input rejection, and must never overwrite preserved inputs.

## Goals / Non-Goals

**Goals:**
- Build both maintained runtime components with address and undefined-behavior diagnostics.
- Reproduce local signal results repeatedly before retaining a sample.
- Minimize bytes only while preserving the same signal result.
- Save sufficient machine-readable context for later comparison.

**Non-Goals:**
- Connect to external devices or services.
- Classify a candidate as a confirmed defect.
- Modify or delete source sample directories.

## Decisions

### Use isolated diagnostic output directories

The ordinary target is written to `build/diagnostics/runtime/openplc_diagnostic`; the custom input component is written below `build/diagnostics/mutator`. Both use `-fsanitize=address,undefined`, debug information, and frame pointers.

### Require stable signal termination

The organizer runs each candidate three times by default. It retains a candidate only when every run ends with the same signal. Ordinary nonzero exits, including rejected input, are not treated as qualifying results.

### Minimize with a bounded deterministic reducer

The reducer removes contiguous byte ranges and accepts a reduction only when the same signal repeats. A configurable evaluation limit bounds work. Exact input digests are deduplicated before execution.

### Write immutable-by-default output

The output directory must not already contain files. Each retained case gets a minimized sample, captured diagnostic text, and JSON metadata; a top-level manifest summarizes tool revisions, target digest, seed, environment, and invoked command.

## Risks / Trade-offs

- Signal-only classification intentionally excludes ordinary error exits.
- Byte minimization preserves the observed signal, not grammar structure or coverage identity.
- ASan/UBSan builds are diagnostic artifacts and are not used as production targets.
