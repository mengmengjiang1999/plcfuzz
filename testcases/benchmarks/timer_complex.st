PROGRAM TimerComplex
  VAR
    PrepareTimer : TON;
    RunTimer : TON;
    CoolTimer : TON;
    Stage : INT := 0;
  END_VAR
  VAR
    Start AT %IX0.0 : BOOL;
    Reset AT %IX0.1 : BOOL;
    Preparing AT %QX0.0 : BOOL;
    Running AT %QX0.1 : BOOL;
    Complete AT %QX0.2 : BOOL;
  END_VAR
  IF Reset THEN Stage := 0; END_IF;
  PrepareTimer(IN := (Stage = 0) AND Start, PT := T#100ms);
  IF PrepareTimer.Q THEN Stage := 1; END_IF;
  RunTimer(IN := Stage = 1, PT := T#150ms);
  IF RunTimer.Q THEN Stage := 2; END_IF;
  CoolTimer(IN := Stage = 2, PT := T#100ms);
  IF CoolTimer.Q THEN Stage := 3; END_IF;
  Preparing := Stage = 0 AND Start;
  Running := Stage = 1;
  Complete := Stage = 3;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : TimerComplex;
  END_RESOURCE
END_CONFIGURATION
