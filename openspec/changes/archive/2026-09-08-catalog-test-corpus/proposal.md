## Why

The repository contains 40 Structured Text cases and 31 ladder-diagram cases across active, compiler-compatibility, and archival directories, but their expected result and review status exist only in partial prose. A machine-readable catalog is needed to prevent silent additions, removals, or incorrect suite selection.

## What Changes

- Add a versioned TSV manifest covering every tracked `.st` and `.ld` testcase.
- Record current path, original path, language, collection, MatIEC profile, expected result, origin status, license status, and research purpose.
- Mark unknown origin or license details explicitly for the later provenance-review theme instead of inferring them.
- Add structural validation that compares the manifest with the tracked testcase tree and checks allowed field values.
- Add an optional compiler verification mode that confirms all 27 active ST cases pass their profiles and all 13 archived ST cases remain rejected by the pinned MatIEC.
- Integrate the structural check into the existing testcase validator and update documentation and roadmap status.

## Capabilities

### New Capabilities

- `testcase-catalog`: Defines complete machine-readable testcase inventory, explicit metadata status, and consistency validation.

### Modified Capabilities

None.

## Impact

This change adds testcase metadata and validation scripts and updates testcase documentation, the existing validation entry point, and the improvement roadmap. Testcase source files and runtime behavior remain unchanged.
