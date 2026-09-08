PROGRAM TimerCounter
  VAR
    Timer : TON;
    Counter : CTU := (PV := 10);
  END_VAR
  VAR
    Enable AT %IX0.0 : BOOL;
    Reset AT %IX0.1 : BOOL;
    Pulse AT %QX0.0 : BOOL;
  END_VAR

  Timer(IN := Enable, PT := T#500ms);
  Counter(CU := Timer.Q, R := Reset);
  Pulse := Counter.Q;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : TimerCounter;
  END_RESOURCE
END_CONFIGURATION
