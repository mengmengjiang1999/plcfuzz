PROGRAM CounterComplex
  VAR
    UnitCount : CTU := (PV := 3);
    BatchCount : CTU := (PV := 2);
    PreviousUnitReady : BOOL := FALSE;
  END_VAR
  VAR
    Pulse AT %IX0.0 : BOOL;
    Reset AT %IX0.1 : BOOL;
    UnitReady AT %QX0.0 : BOOL;
    AllReady AT %QX0.1 : BOOL;
    Batches AT %QW0 : INT;
  END_VAR
  UnitCount(CU := Pulse, R := Reset OR UnitCount.Q);
  BatchCount(CU := UnitCount.Q AND NOT PreviousUnitReady, R := Reset);
  PreviousUnitReady := UnitCount.Q;
  UnitReady := UnitCount.Q;
  AllReady := BatchCount.Q;
  Batches := BatchCount.CV;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : CounterComplex;
  END_RESOURCE
END_CONFIGURATION
