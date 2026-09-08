# Disabled OpenPLC source snapshot

These files came from the earlier OpenPLC-derived runtime tree. Four were entirely commented, `interactive_server.cpp` only supplied global definitions around disabled server code, and the client, DNP3, and persistence modules were no longer reachable after that server was disabled.

They are retained for historical comparison and are not compiled. The globals still required by maintained modules now live in `src/runtime_globals.cpp`. Removing the unreachable DNP3 path also removes unused OpenDNP3 and libmodbus link requirements from the focused experiment runtime.
