PROGRAM CounterGeneral
  VAR
    Accepted : CTU := (PV := 4);
    Rejected : CTU := (PV := 2);
  END_VAR
  VAR
    AcceptPulse AT %IX0.0 : BOOL;
    RejectPulse AT %IX0.1 : BOOL;
    Reset AT %IX0.2 : BOOL;
    BatchReady AT %QX0.0 : BOOL;
    ReviewNeeded AT %QX0.1 : BOOL;
  END_VAR
  Accepted(CU := AcceptPulse, R := Reset);
  Rejected(CU := RejectPulse, R := Reset);
  BatchReady := Accepted.Q;
  ReviewNeeded := Rejected.Q;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : CounterGeneral;
  END_RESOURCE
END_CONFIGURATION
