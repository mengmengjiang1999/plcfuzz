## Context

Remote Linux evidence identifies a clean-build ordering issue inside MatIEC's generated recursive Makefiles. Project-wide `BUILD_JOBS=2` unintentionally controlled MatIEC and allowed two subdirectories to compile the same parent object concurrently.

## Goals / Non-Goals

**Goals:** Make clean MatIEC setup deterministic while preserving parallelism elsewhere.

**Non-Goals:** Rewrite the MatIEC build system or change compiler behavior.

## Decisions

Use `MATIEC_BUILD_JOBS`, defaulting to `1`, in `setup_matiec.sh`. The workflow declares this value explicitly, while its general `BUILD_JOBS=2` remains available to AFL++ and CMake.

## Risks / Trade-offs

- **MatIEC setup takes longer** → Reliability is preferred for the pinned compiler; advanced users may test a larger dedicated value.

## Migration Plan

Update the setup script and workflow, run local checks, archive, push, and verify the full remote job.

## Open Questions

None.
