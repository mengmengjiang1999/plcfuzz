## MODIFIED Requirements

### Requirement: Explicit active runtime sources

The runtime build SHALL compile explicit lists of maintained and generated translation units, SHALL use separate compilation rules and warning controls for those groups, and SHALL NOT automatically include arbitrary `.cpp` files based on directory membership.

#### Scenario: New source file appears

- **WHEN** an unreviewed `.cpp` file is added under `src/`
- **THEN** it is not compiled until the maintained or generated Makefile source manifest is deliberately updated

#### Scenario: Generated PLC source is compiled

- **WHEN** a MatIEC or binding translation unit is built
- **THEN** inherited generated-header diagnostics use the generated warning policy and do not obscure maintained-source warnings
