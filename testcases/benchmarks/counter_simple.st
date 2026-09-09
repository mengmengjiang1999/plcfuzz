PROGRAM CounterSimple
  VAR
    Count : CTU := (PV := 3);
  END_VAR
  VAR
    Pulse AT %IX0.0 : BOOL;
    Reset AT %IX0.1 : BOOL;
    Reached AT %QX0.0 : BOOL;
    Value AT %QW0 : INT;
  END_VAR
  Count(CU := Pulse, R := Reset);
  Reached := Count.Q;
  Value := Count.CV;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : CounterSimple;
  END_RESOURCE
END_CONFIGURATION
