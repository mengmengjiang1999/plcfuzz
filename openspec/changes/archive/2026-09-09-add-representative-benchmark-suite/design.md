## Context

The repository has a complete inventory of ST and LD files, but those files were accumulated for different purposes and do not form a controlled research benchmark. The new evaluation protocol needs stable benchmark IDs, comparable complexity labels, explicit located-variable interfaces, source boundaries, and replay artifacts. The suite must compile with the pinned MatIEC legacy profile and remain usable without adding dependencies.

## Goals / Non-Goals

**Goals:**

- Cover five common PLC control patterns at each of three documented complexity levels.
- Make every program, interface, state estimate, behavior statement, provenance decision, replay sample, and expected trace machine-readable.
- Detect catalog drift, invalid input data, content changes, compiler rejection, and nondeterministic MatIEC output.
- Integrate the suite with the existing testcase inventory and canonical command.

**Non-Goals:**

- Claim that fifteen small programs represent every industrial PLC workload.
- Import third-party programs or convert existing LD material in this change.
- Treat a declared trace as a substitute for later instrumented runtime measurement.
- Define strategy comparison or statistical reporting, which belong to subsequent changes.

## Decisions

### Use a complete five-by-three matrix

The suite will contain one case for every combination of `timer`, `counter`, `state-machine`, `interlock`, and `sequential-control` with `simple`, `general`, and `complex`. A smaller suite was considered, but it would confound control pattern with complexity. Fifteen cases keep the design balanced while remaining inexpensive to compile.

### Keep the suite project-authored

Every initial case will be newly written for this repository and marked `project-authored` / `GPL-3.0-only`. The schema still requires an origin classification from `project-authored`, `third-party`, or `transformed`, so later additions cannot blur those boundaries. Importing audited material was considered but rejected because licensing and transformation differences would weaken the initial comparison matrix.

### Store a JSON catalog plus per-case artifacts

`benchmarks/manifest-v1.json` will be the authority. Each entry records stable ID, category, complexity, ST path and digest, located inputs and outputs, modeled state count, behavior statements, provenance, minimal replay path and digest, and expected trace path and digest. JSON is used because nested variable and behavior metadata is awkward in TSV.

### Use versioned replay records and declarative traces

Each case gets the smallest multi-step V1 input that exercises its documented behavior and a JSON trace describing named input, state, and output values per step. Validation checks format, bounds, step counts, names, uniqueness, checksums, and repeatability of parsing. Runtime comparison against these traces can be added after the offline runtime observation layer is modularized.

### Verify compiler determinism separately from behavioral traces

Optional compiler verification compiles every ST program twice in isolated directories with the pinned MatIEC profile, requires acceptance, and compares generated file names and SHA-256 digests. This catches nondeterministic source generation without relying on timing-sensitive runtime logs.

## Risks / Trade-offs

- [Modeled state counts are abstractions] → Define them as documented logical control states, not all possible data valuations.
- [Declarative traces can drift from program behavior] → Bind source, replay, and trace with checksums and require focused review; later runtime observation work can strengthen the check.
- [Fifteen programs increase maintenance] → Generate no source files; keep cases small, consistently structured, and validate the whole matrix automatically.
- [MatIEC output could include environment-dependent content] → Compare two compilations within the same invocation and report differing generated paths explicitly.

## Migration Plan

Add the suite without changing existing runtime examples. Register the new ST files in `testcases/manifest.tsv`, enable the new validator in unit and testcase workflows, then document benchmark selection. Removal is a normal revert because no current command or stored experiment format is replaced.

## Open Questions

None. Runtime-level trace confirmation is intentionally deferred to the later offline-runtime modularization theme.
