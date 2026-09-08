## 1. Mapping state

- [x] 1.1 Add strict, row-aware mapping CSV parsing
- [x] 1.2 Store mappings per mutator instance and support an explicit mapping path
- [x] 1.3 Contain initialization errors at the AFL++ C ABI boundary

## 2. Seeded mutations

- [x] 2.1 Route all random decisions and values through the instance generator
- [x] 2.2 Replace unsafe wide shifts and implicit signed arithmetic
- [x] 2.3 Remove unused cache and selection code

## 3. Verification

- [x] 3.1 Add mutator integration tests for reproducibility, mapping errors, parsing, and maximum output size
- [x] 3.2 Run unit tests, sanitizer coverage, and strict compilation
- [x] 3.3 Document the seeded and mapping-path reproducibility contract
- [x] 3.4 Validate and archive the OpenSpec change
