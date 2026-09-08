## Why

The runtime build compiles every `src/*.cpp` file, including four fully commented legacy modules and a mostly disabled interactive server that now only supplies globals. The active tree also contains duplicate experimental grammars, an obsolete mutator copy, and a stale second variable mapping, making it unclear which files define current behavior.

## What Changes

- Replace wildcard runtime source discovery with an explicit maintained source list.
- Move required runtime globals into a focused translation unit.
- Move disabled legacy protocol sources and the old mutator/grammar variants under a documented archival directory.
- Remove the byte-identical temporary grammar copy and stale analyzer-local mapping copy while retaining their history in Git.
- Document which generated files are intentionally tracked as a buildable reference snapshot and which command refreshes them.
- Add structural checks that prevent archived or unexpected source files from entering the active build.

## Capabilities

### New Capabilities

- `repository-source-layout`: Defines active runtime sources, archived experimental material, and generated snapshot ownership.

### Modified Capabilities

None.

## Impact

The Makefile, runtime globals, source and fuzz-configuration layout, static-analyzer documentation, repository README, and validation scripts are affected. Historical content remains available under `artifacts/legacy/` or through Git history.
