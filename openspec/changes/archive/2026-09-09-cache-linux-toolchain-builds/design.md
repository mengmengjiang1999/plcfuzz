## Context

MatIEC and AFL++ are fixed to repository-controlled revisions, but the GitHub-hosted Linux workflow rebuilds both from source on every run. GitHub's cache action supports exact keys and exposes whether the primary key matched. Its v5 line uses Node.js 24, matching the workflow's checkout action runtime.

## Goals / Non-Goals

**Goals:**

- Reduce repeated Linux workflow duration.
- Invalidate cached outputs whenever source identity, compiler version, OS, architecture, or cache schema changes.
- Continue running MatIEC tests and all project checks on every revision.
- Keep failed jobs from producing reusable caches.

**Non-Goals:**

- Cache project outputs that vary with the PLC program or project source.
- Change the reproducibility container's clean build.
- Use prefix restore keys that could select a different toolchain revision.

## Decisions

### Exact keys without fallback prefixes

The workflow computes source and compiler identities after checkout and dependency installation. Cache keys include `runner.os`, `runner.arch`, the fixed source identity, compiler version, and a manually incremented schema. No restore prefix is used, so a different revision cannot be selected as a near match.

### Cache complete tool source trees

Both upstream projects build in their source directories. Caching the complete tree preserves generated configuration, dependency files, objects, libraries, test programs, and final compiler wrappers as one consistent unit.

### Re-run MatIEC tests on every hit

Cached Automake log and result files are removed before `make check`, causing the test harness to execute again. The prebuilt mode is accepted only when the compiler, top-level Makefile, and compiler support library exist.

### Retain cold-path version checks

The AFL++ step skips clone and compilation only when the exact primary cache key matched, then always verifies the wrapper exists and reports its version. A miss follows the existing source-build commands unchanged.

## Risks / Trade-offs

- GitHub cache storage may evict inactive entries; eviction only returns the workflow to the full-build path.
- Runner image compiler changes create new keys and consume another cache entry.
- MatIEC test execution remains a substantial fixed cost by design.
