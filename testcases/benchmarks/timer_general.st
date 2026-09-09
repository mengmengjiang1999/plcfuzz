PROGRAM TimerGeneral
  VAR
    Warmup : TON;
    Hold : TOF;
  END_VAR
  VAR
    Enable AT %IX0.0 : BOOL;
    Warm AT %QX0.0 : BOOL;
    Active AT %QX0.1 : BOOL;
  END_VAR
  Warmup(IN := Enable, PT := T#100ms);
  Hold(IN := Warmup.Q, PT := T#150ms);
  Warm := Warmup.Q;
  Active := Hold.Q;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : TimerGeneral;
  END_RESOURCE
END_CONFIGURATION
