## Why

The runtime currently creates fallback buffer values one slot at a time and exposes unchecked numeric indexes at the input boundary. Ownership is implicit, existing generated mappings can be overwritten, and an incomplete pointer table can lead to partial updates or invalid reads.

## What Changes

- Replace per-slot dynamic allocation with one zero-initialized, process-lifetime fallback storage object.
- Preserve generated variable mappings and attach fallback addresses only to missing slots.
- Introduce bounded input-slot and bit-offset value types at the input application boundary.
- Make input application and history sampling reject incomplete mappings before changing state.
- Use scope-bound mutex ownership in hardware buffer updates.
- Replace internal fixed C arrays with `std::array` and remove unnecessary polymorphism from input value objects.

## Capabilities

### New Capabilities

- `runtime-resource-ownership`: Runtime fallback storage, address validation, atomic input application, checked history sampling, and scope-bound locking have explicit invariants.

## Impact

- The generated OpenPLC global pointer-array ABI remains unchanged.
- Existing generated mappings are retained during hardware initialization.
- Incomplete runtime mappings are reported instead of being partially processed.
- Unit and structural checks cover ownership, bounds, and lock release.
