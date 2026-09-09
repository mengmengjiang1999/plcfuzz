## 1. Runtime Ownership and Boundaries

- [x] 1.1 Add process-lifetime fallback storage that preserves generated mappings
- [x] 1.2 Add bounded input-slot and bit-offset value types
- [x] 1.3 Make input application and history sampling reject incomplete mappings before mutation
- [x] 1.4 Replace internal fixed arrays and unnecessary polymorphism with value semantics
- [x] 1.5 Manage hardware buffer locks with a non-copyable scope guard

## 2. Verification and Documentation

- [x] 2.1 Add unit coverage for fallback ownership, bounds, atomic application, history sampling, and lock release
- [x] 2.2 Add a structural ownership check and integrate it with the unified test command
- [x] 2.3 Document runtime invariants and update the improvement roadmap
- [x] 2.4 Run unit, affected-source compile, wording, license, and strict OpenSpec checks
- [x] 2.5 Archive the OpenSpec change and validate resulting specifications
- [x] 2.6 Commit and push the completed change
