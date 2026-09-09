PROGRAM InterlockSimple
  VAR
    Request AT %IX0.0 : BOOL;
    GuardClosed AT %IX0.1 : BOOL;
    Enabled AT %QX0.0 : BOOL;
  END_VAR
  Enabled := Request AND GuardClosed;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : InterlockSimple;
  END_RESOURCE
END_CONFIGURATION
