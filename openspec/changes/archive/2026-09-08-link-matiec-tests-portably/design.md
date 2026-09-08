## Context

The pinned MatIEC top-level test targets reuse the executable archive list. `compiler/libcompiler.a` occurs before `absyntax/libabsyntax.a`; on Linux, the latter introduces references to `error_exit` only after the linker has already scanned the compiler archive. macOS resolves this archive sequence differently, so local testing did not expose the missing trailing provider.

## Goals / Non-Goals

**Goals:**
- Make the authoritative MatIEC test command link on Linux and macOS.
- Preserve the pinned submodule without project-local source edits inside it.
- Keep full upstream tests enabled in CI.

**Non-Goals:**
- Change MatIEC compiler behavior.
- Skip or weaken any MatIEC tests.

## Decisions

### Supply an absolute trailing library through `LIBS`

The setup script invokes `make check` with `LIBS` set to the absolute path of `compiler/libcompiler.a`. Automake appends `LIBS` to program link commands, placing the symbol provider after the archives that reference it. An absolute path also remains valid in recursive subdirectory tests.

### Retain upstream test targets

The correction changes only link inputs. The same test suite and pass criteria continue to run.

## Risks / Trade-offs

- This compatibility input can become redundant after the pinned MatIEC Makefile orders its archives portably. Keeping it explicit is harmless and the associated check makes later removal deliberate.
