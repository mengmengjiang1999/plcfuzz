## Context

Exploration showed that `plclogic/VARIABLES.csv` describes program hierarchy but omits located addresses. `plclogic/LOCATED_VARIABLES.h` contains one structured macro record per located variable with IEC type, symbolic name, area, width, array index, and optional bit index. The current generator instead searches assignment text inside `src/glueVars.cpp`.

## Goals / Non-Goals

**Goals:**

- Parse the structured MatIEC records directly and deterministically.
- Validate every supported mapping before replacing the output file.
- Preserve the existing custom-mutator CSV contract.
- Prove equivalence with the tracked reference snapshot.

**Non-Goals:**

- Change the MatIEC or OpenPLC generated formats.
- Add runtime mapping classes not represented by current buffer arrays.
- Modify the custom mutator's mapping reader.

## Decisions

1. Parse the comma-separated arguments inside exact `__LOCATED_VAR(...)` lines. Reject other nonblank content instead of silently skipping it.
2. Map areas `I` and `Q` with widths `X`, `B`, `W`, `D`, and `L` to the existing input/output arrays; map memory area `M` widths `W`, `D`, and `L` to memory arrays.
3. Require `X` locations to contain a bit index and all other locations to omit it. All indices must be non-negative decimal integers.
4. Validate the symbolic name against the location fields and detect duplicate runtime destinations.
5. Build the complete result in memory and write only after all records pass validation, preventing partial output.
6. Track a small reference copy of the default program's located-variable records so lightweight snapshot checks also work before generated `plclogic/` exists.

## Risks / Trade-offs

- **A future MatIEC record extension is rejected** → Explicit failure makes the required mapping update visible.
- **Some location classes remain unsupported** → Report them clearly; adding runtime storage belongs in a separate change.

## Migration Plan

Replace the glue-text parser, update default input and structural checks, add fixtures and documentation, regenerate the reference mapping, and confirm byte equivalence.

## Open Questions

None.
