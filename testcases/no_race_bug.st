TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE


PROGRAM program0
  VAR
      PB1 AT %IX0.0 : BOOL;
      PB2 AT %IX0.1 : BOOL;
        S1 AT %IX0.2 : BOOL;
        S2 AT %IX0.3 : BOOL;
        S3 AT %IX0.4 : BOOL;
        ValveA AT %QX0.0 : BOOL;
        ValveB AT %QX0.4 : BOOL;
        ValveC AT %QX0.2 : BOOL;
        M0_0  AT %QX0.3: BOOL;

    END_VAR

    M0_0 := PB1 AND S1;
    ValveA := M0_0;
    ValveB := PB2 OR S2;
    ValveC := NOT S3;

END_PROGRAM

CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
