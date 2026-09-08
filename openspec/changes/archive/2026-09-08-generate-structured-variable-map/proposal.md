## Why

The current mapping generator uses regular expressions over the formatting of generated `src/glueVars.cpp`, although MatIEC already emits structured located-variable records. Formatting changes in the generated C++ can therefore change or omit mappings without reflecting a change in the PLC addresses.

## What Changes

- Generate `plc_variables_mapping.csv` directly from MatIEC's `LOCATED_VARIABLES.h` macro records.
- Validate record shape, IEC type, location area, width code, array index, optional bit index, and duplicate runtime destinations.
- Keep the existing four-column mapping output contract used by the custom mutator.
- Add unit fixtures for every supported input, output, and memory mapping class plus malformed and unsupported records.
- Update build integration, snapshot checks, documentation, and roadmap status.

## Capabilities

### New Capabilities

- `structured-variable-map`: Defines deterministic mapping generation from MatIEC located-variable metadata and explicit validation of supported runtime destinations.

### Modified Capabilities

None.

## Impact

The static analysis utility, source-layout verification, documentation, tests, and improvement roadmap are affected. The custom-mutator CSV schema and tracked reference mapping remain unchanged.
