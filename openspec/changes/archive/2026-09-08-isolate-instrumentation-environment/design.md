## Context

The instrumented build passed `AFL_CXX` as the path to `afl-clang-fast++`. Inside that wrapper, AFL++ reads `AFL_CXX` as the executable it should call next, so it launched the same wrapper recursively. AFL++ also checks unknown variables beginning with `AFL_`, which made the unrelated build-job setting noisy.

## Goals / Non-Goals

**Goals:**
- Ensure the wrapper delegates to its configured real compiler instead of itself.
- Keep project-only controls outside the upstream reserved prefix.
- Detect reintroduction of either conflicting variable.

**Non-Goals:**
- Change AFL++'s own supported variables.
- Change instrumentation flags or the fixed release.

## Decisions

### Use project-prefixed names

`PLCFUZZ_INSTRUMENTED_CXX` selects the wrapper used by the project Makefile. `PLCFUZZ_TOOLCHAIN_BUILD_JOBS` controls only the fixed source build. Neither name begins with `AFL_`, so the wrapper does not reinterpret or warn about them.

### Reject legacy selectors in structural checks

The CI checker requires the two new names and fails if the maintained workflow or build script contains `AFL_CXX` or `AFL_BUILD_JOBS`.

## Risks / Trade-offs

- Existing local commands using the old project selector must switch to `PLCFUZZ_INSTRUMENTED_CXX`. The old name cannot remain as a compatibility alias because merely exporting it recreates the recursive delegation.
