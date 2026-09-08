## Context

OpenPLC's generated glue layer defines 1024 address slots for every I/O family. PLCFuzz reduced the shared `BUFFER_SIZE` declaration to 8 because its seed grammar models only eight slots. The linker cannot enforce array-bound consistency across translation units, so the mismatch compiles while violating the shared C++ type contract.

## Goals / Non-Goals

**Goals:**

- Make every declaration of linked OpenPLC I/O arrays use 1024 entries.
- Keep fuzz blocks and serialized inputs at eight modeled slots.
- Give both values names that communicate their distinct roles.

**Non-Goals:**

- Expand the seed format to 1024 values per type.
- Change MatIEC or the binary glue generator.
- Redesign history/oracle behavior beyond using the correct runtime capacity.

## Decisions

- Define `OPENPLC_BUFFER_SIZE` as 1024 and retain `BUFFER_SIZE` as a compatibility alias for upstream-derived runtime code. This avoids a broad unrelated upstream rewrite while matching generated glue.
- Define `PLC_INPUT_SIZE` as 8 and use it in input block storage, parsing, serialization, mutator bounds, and snapshot application loops.
- Destination array signatures remain runtime-sized, but only the first `PLC_INPUT_SIZE` entries receive fuzz snapshot values.
- Rename the interactive server's local string capacity to `COMMAND_BUFFER_SIZE`; it is not a PLC address capacity.

## Risks / Trade-offs

- [History arrays grow when runtime capacity returns to 1024] → This matches the linked I/O image; optimize history representation in the separate oracle change.
- [Compatibility alias can still be misused] → New PLCFuzz-owned input code MUST use `PLC_INPUT_SIZE`, and compile-time assertions/tests will pin both values.
- [Only eight runtime slots are fuzz-controlled] → Preserve current corpus compatibility and document this intentional modeling boundary.
