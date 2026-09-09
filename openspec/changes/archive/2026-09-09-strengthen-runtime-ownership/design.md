## Context

Generated ladder code publishes global pointer arrays, so replacing that boundary would require changes outside this repository's maintained runtime. The implementation therefore keeps those arrays while moving ownership and validation behind small C++ value types.

## Goals / Non-Goals

**Goals:**

- Give fallback values one clear owner and stable addresses.
- Preserve every non-null generated mapping.
- Validate all destinations before applying an input block or recording a history sample.
- Ensure hardware-layer mutex release follows lexical scope.
- Keep the project compatible with C++11.

**Non-Goals:**

- Change the generated ladder-code ABI.
- Change the serialized input protocol.
- Redesign the PLC execution loop.

## Decisions

### Process-lifetime fallback storage

`RuntimeBufferStorage` owns zero-initialized `std::array` values for each runtime category. A static instance in the hardware layer attaches addresses only where generated arrays contain null pointers. Repeated attachment is idempotent.

### Strong boundary indexes

`PLCInputSlot` and `PLCBitOffset` validate their ranges at construction and expose only a checked numeric value. Input application iterates using these types rather than passing unqualified integers across the boundary.

### Preflight before mutation

Input application and history sampling check every required pointer first. If any pointer is missing, they return `false` without modifying destination data, history contents, or sample chronology.

### Scope-bound locking

`PthreadMutexGuard` acquires in its constructor and releases in its destructor. It is non-copyable, and acquisition failures are surfaced as `std::system_error`.

## Risks / Trade-offs

- The global pointer arrays remain mutable because generated code depends on them. Validation is therefore repeated at each processing boundary.
- A static fallback owner intentionally lives until process exit; this avoids teardown-order dependencies among global runtime objects.
- Checked functions return `bool`, so callers must handle incomplete mappings explicitly.
