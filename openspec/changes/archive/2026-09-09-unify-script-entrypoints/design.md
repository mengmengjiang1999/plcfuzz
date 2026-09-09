## Context

`buildscript.sh`, `buildscript_new.sh`, `run.sh`, `runfuzz.sh`, `run_fuzz_all.sh`, `run_single_fuzz_example.sh`, and `count_code.sh` are historical public entry points. They mix orchestration and implementation, while lower-level scripts are split between `build_scripts/` and `scripts/`. The experiment output layout has already changed, leaving the historical batch collector inconsistent.

## Goals / Non-Goals

**Goals:**

- Provide one stable, self-documenting command for common tasks.
- Keep compatibility wrappers small and behavior-preserving where their old assumptions remain valid.
- Put maintained orchestration under `scripts/`.
- Use isolated result directories in batch operation.

**Non-Goals:**

- Rewrite Make or CMake internals.
- Remove root wrappers in this change.
- Change input formats, runtime semantics, or diagnostic policies.

## Decisions

### Use a Bash dispatcher

`scripts/plcfuzz` will be the sole user-facing dispatcher. It keeps existing environment-variable controls and calls focused implementation scripts. Bash is already required by maintained scripts and avoids a new runtime dependency.

### Preserve the existing build step vocabulary

The `build` subcommand accepts `all`, `plc`, `runtime`, `analyze`, `mutator`, and `instrumented`, plus the prior aliases in compatibility mode. Documentation uses only the canonical names.

### Separate maintained cores from wrappers

Experiment, direct runtime, replay, and batch implementations move to semantic files below `scripts/`. Root scripts contain only a notice and `exec` forwarding. Structural validation enforces this boundary.

### Replace fixed batch collection with isolated directories

Each batch case builds its selected ST program and invokes the experiment lifecycle below a configurable batch root. Manifests and tool outputs remain together, so the batch no longer copies from a fixed `findings/default` path.

## Risks / Trade-offs

- Users invoking historical commands will see new stderr output. The notice is intentional and the exit status comes from the forwarded command.
- External automation may parse old batch result filenames. The compatibility wrapper keeps the command name, but callers should migrate to the documented isolated directory layout.
