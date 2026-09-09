## Context

The project has already removed ambiguous prose and states its academic, offline scope prominently. Its public command, several project-owned directories, generated targets, and configuration variables still inherit names from the early prototype. At the same time, AFL++ requires exact executable names, environment variables, and exported C ABI symbols, while historical experiment records must remain reproducible.

## Goals / Non-Goals

**Goals:**

- Present one neutral project identity and canonical command.
- Use input-generation, observation, and instrumented-runtime terminology for project-owned interfaces.
- Preserve existing callers through narrow compatibility aliases with migration notices.
- Enforce the boundary automatically across maintained paths and text.

**Non-Goals:**

- Rename the GitHub repository in this change.
- Modify externally defined AFL++ names or raw measurement schemas.
- Rewrite the input generation algorithm, experiment semantics, or preserved historical data.
- Change the versioned serialized input header.

## Decisions

### Use PLC Robustness Lab and `plc-lab`

The maintained display name describes the research scope directly. `scripts/plc-lab` becomes the implementation-bearing dispatcher; `scripts/plcfuzz` becomes a small forwarding wrapper with a migration notice.

### Rename maintained project-owned surfaces

The canonical source directory becomes `input_generation/`; the shared component is an input transformer; the generated executable is `openplc_instrumented`; and active experiment output defaults to `observations/`. Build and diagnostic commands use `transformer` and `instrumented`. Old command-step aliases and environment variables remain accepted temporarily.

### Keep external and recorded names exact

Names beginning with `AFL_`, the `afl-fuzz` executable, `afl_custom_*` ABI exports, upstream source paths, and raw statistics fields remain unchanged. The serialized `PLCFUZZ_INPUT_V1` header is also retained as an established compatibility token and documented as such.

### Enforce both content and path vocabulary

The wording check continues scanning authored text for prohibited phrases and adds checks for deprecated project-owned names in maintained paths and documentation. A small explicit compatibility allowlist replaces broad directory exemptions.

## Risks / Trade-offs

- Downstream scripts may depend on former artifact paths. Compatibility aliases cover commands and environment inputs, while renamed build artifacts are announced clearly.
- A broad mechanical rename can miss references. Structure tests, unit tests, CI checks, and repository-wide searches guard the migration.
- Keeping required upstream names means a simple global word ban is incorrect; the checker must validate context and ownership instead.
