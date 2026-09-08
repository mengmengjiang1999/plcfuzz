## Context

Exploration confirmed that the complete maintained workflow is Linux-specific and ordered. MatIEC must be built before ST conversion; generated PLC code precedes both runtime builds; structured mapping follows conversion; and AFL++ 4.10c is required for the instrumented target. Current local checks cover components but no remote runner verifies the entire sequence.

## Goals / Non-Goals

**Goals:**

- Verify the full maintained path on Ubuntu 22.04.
- Use repository-pinned MatIEC and AFL++ versions.
- Fail at the first unsuccessful command and assert final outputs.
- Avoid granting write permissions to workflow jobs.

**Non-Goals:**

- Publish packages or container images.
- Run long-duration experiments.
- Add dependency caching before a measured need exists.

## Decisions

1. Use one ordered job so generated outputs and failure context remain straightforward.
2. Use `actions/checkout@v4` with recursive submodules and `permissions: contents: read`.
3. Run on `ubuntu-22.04`, matching the documented authoritative environment rather than a moving latest image.
4. Build AFL++ tag `v4.10c` in the runner temporary directory with `source-only`; the workflow does not depend on the distribution package version.
5. Add concurrency cancellation for superseded revisions and a 45-minute job timeout.
6. Assert expected files after builds so a no-op command cannot look successful.

## Risks / Trade-offs

- **Building MatIEC and AFL++ increases duration** → Prefer correctness initially; add keyed caches only after observing stable outputs.
- **Upstream source availability affects setup** → The exact MatIEC commit is in the submodule and the exact AFL++ tag is recorded; transient download failures remain visible.

## Migration Plan

Add the workflow, validate its structure locally, push it with the archived change, and observe the first GitHub Actions result before treating remote verification as established.

## Open Questions

None.
