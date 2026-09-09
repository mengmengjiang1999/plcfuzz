## Why

The offline runtime entry point and compatibility message implementation each combine several independent responsibilities in one large translation unit. This makes lifecycle behavior, input application, state observation, result recording, and protocol compatibility harder to test or evolve independently. Generated MatIEC diagnostics are also mixed with maintained-source diagnostics during ordinary builds.

## What Changes

- Reduce `src/main.cpp` to a thin entry point and move runtime orchestration behind an offline-runtime boundary.
- Add explicit modules for input loading/application, cycle scheduling, state observation, and result recording.
- Keep the inherited OpenPLC hardware function interface as a compatibility adapter that delegates to the new offline modules.
- Split compatibility message handling into dispatch, discrete-value, register-value, and unused-buffer mapping translation units while preserving function signatures and response behavior.
- Give maintained and generated sources separate Makefile manifests, warning flags, and compilation rules.
- Add unit and structural checks for module boundaries, scheduling, recording, input application, message dispatch, and generated-warning isolation.
- Update coverage scope/baseline, documentation, license boundaries, and the roadmap.

## Capabilities

### New Capabilities

- `modular-offline-runtime`: Defines runtime layers, compatibility adapters, protocol-module separation, and dependency direction.

### Modified Capabilities

- `repository-source-layout`: Requires explicit maintained/generated source groups and modular runtime structure.
- `project-code-coverage`: Includes the new maintained runtime modules without adding generated or MatIEC sources.
- `improvement-roadmap`: Marks the final planned theme complete.

## Impact

The normal, diagnostic, coverage, and instrumented runtime builds gain additional translation units but retain their target names and command lines. The refactor preserves serialized input, OpenPLC hardware hooks, compatibility message function signatures, AFL++ integration, runtime result text, and output-change observation behavior.
