## Context

Exploration found a 119-field record composed of one 65-field boolean block and six 9-field numeric blocks. The runtime reads records directly with stream operators, while the custom mutator has a separate wrapper around the same operators. The active grammar describes the field counts but has no version marker. Five preserved seeds contain two unversioned records each and must remain reproducible.

## Goals / Non-Goals

**Goals:**

- Define and document one canonical V1 representation.
- Share strict parsing and serialization between runtime and mutator.
- Preserve read compatibility for existing unversioned data.
- Make future format revisions detectable rather than silently misparsed.

**Non-Goals:**

- Change the logical PLC input model or its eight-slot capacity.
- Rewrite preserved seeds or experiment outputs.
- Introduce a binary encoding or an external schema dependency.

## Decisions

1. Use the first-token header `PLCFUZZ_INPUT_V1`. It is easy to recognize in text files and grammar output, and cannot be confused with the numeric first field of the legacy layout.
2. Keep whitespace-separated unsigned decimal values. This preserves human readability and keeps existing AFL++ grammar integration simple.
3. Put the parser and serializer in a shared header under `include/` because the runtime and custom mutator are built through different build systems. A header-only implementation avoids adding linkage coordination between Make and CMake.
4. Parse numeric tokens explicitly and check destination limits before assignment. Stream extraction followed by a cast can silently narrow large values.
5. Accept unversioned input only when the first token is decimal data. All newly serialized or grammar-generated content uses V1.
6. Preserve the five tracked legacy seeds byte-for-byte. Compatibility tests use them as evidence that historical inputs remain readable.

## Risks / Trade-offs

- **Header bytes reduce mutation space slightly** → The header is short and provides deterministic format identification.
- **Strict validation rejects previously truncated values** → Rejection is intentional because silent narrowing weakens reproducibility.
- **Header-only parsing increases compile input** → The implementation is small and used by only the runtime, mutator, and unit tests.

## Migration Plan

Add the shared implementation, switch runtime and mutator to it, update the grammar to emit V1, document the layout, and test both V1 and preserved legacy input. No historical file migration is performed.

## Open Questions

None.
