## Context

The C++ unit-test script compiles small binaries directly, the full runtime is built through Make, and Python tools are tested as standalone scripts. MatIEC and PLC-generated sources share the full-runtime build graph, so unconstrained compiler coverage would overstate project coverage. The maintained CI runner can install `lcov` and Python Coverage.py, while local contributors may only have compiler-native tools.

## Goals / Non-Goals

**Goals:**

- Define an auditable whitelist of maintained source files and explicit exclusion roots.
- Measure C++ unit and full-runtime integration execution in one report.
- Measure maintained Python tools using the existing test suite.
- Record an initial baseline without prematurely rejecting revisions.
- Upload machine-readable and browsable CI artifacts.

**Non-Goals:**

- Measure MatIEC, generated PLC C, or generated binding source.
- Claim a quality level from one coverage percentage.
- require coverage dependencies for the ordinary unit-test command.
- Add a third-party coverage service or write token.

## Decisions

### Use a versioned source whitelist

`coverage/scope-v1.json` lists each maintained C++ and Python source and separately records excluded roots and files. Collection fails if a listed source is missing. The collector extracts only whitelist paths, so a new source must be reviewed before it affects totals.

### Exercise the full runtime as an integration check

The coverage workflow generates PLC sources from the maintained no-output-change state reference, generates the variable map, builds a separate compiler-instrumented normal runtime, and runs it with a valid versioned replay input and a small cycle count. It also checks missing and invalid input handling. This reaches the real `src/main.cpp` boundary instead of substituting a test-only entry point.

### Keep normal unit tests reusable

`scripts/test_unit.sh` accepts optional build directory and compiler/link flags. Its default behavior is unchanged. The coverage workflow supplies GNU coverage flags and wraps Python invocations with Coverage.py.

### Publish separate language reports

GNU `gcov` data is converted to filtered LCOV and HTML. Coverage.py produces JSON, XML, and HTML. `summary.json` retains separate line totals and percentages, the exact scope digest, the baseline comparison, integration-check outcomes, and exclusions. No combined percentage hides differences between languages.

### Start with an observed, non-blocking baseline

The committed baseline stores observed C++ and Python line percentages and uses `enforcement: report-only`. Validation reports regressions against those values but does not fail solely for a percentage decrease. A later OpenSpec change may introduce thresholds after multiple stable CI runs.

## Risks / Trade-offs

- [Generated headers contribute inline execution] → Extract only declared maintained source files and record all exclusions in the summary.
- [Platform-specific counts vary] → Treat Ubuntu 22.04 CI as authoritative and keep the first baseline non-blocking.
- [Runtime output-change observation ends a run early] → Use a deterministic representative program/input pair and explicitly validate the expected exit status.
- [Coverage dependencies are absent locally] → Provide a clear dependency check and keep report validation dependency-free.

## Migration Plan

Add coverage as an independent command and CI stage. Existing build/test entry points keep their defaults. Reverting removes the coverage stage, artifacts, and optional test flags without changing runtime behavior.

## Open Questions

None. Threshold enforcement is intentionally deferred until CI history is available.
