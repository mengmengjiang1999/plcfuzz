## 1. Timing primitives

- [x] 1.1 Add validated environment configuration for cycle count and wall-clock delay
- [x] 1.2 Add nanosecond-safe deadline and running-statistics helpers

## 2. Runtime integration

- [x] 2.1 Replace hard-coded loop timing with resolved runtime configuration
- [x] 2.2 Replace inconsistent duration and latency calculations with sample statistics
- [x] 2.3 Document timing controls and logical-time separation

## 3. Verification

- [x] 3.1 Add unit coverage for defaults, overrides, invalid values, timespec math, and statistics
- [x] 3.2 Run unit tests and strict compilation checks
- [x] 3.3 Validate and archive the OpenSpec change
