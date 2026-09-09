PROGRAM TimerSimple
  VAR
    Delay : TON;
  END_VAR
  VAR
    Enable AT %IX0.0 : BOOL;
    Ready AT %QX0.0 : BOOL;
  END_VAR
  Delay(IN := Enable, PT := T#100ms);
  Ready := Delay.Q;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : TimerSimple;
  END_RESOURCE
END_CONFIGURATION
