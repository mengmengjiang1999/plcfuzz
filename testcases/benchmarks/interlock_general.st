PROGRAM InterlockGeneral
  VAR
    RequestA AT %IX0.0 : BOOL;
    RequestB AT %IX0.1 : BOOL;
    GuardClosed AT %IX0.2 : BOOL;
    EnableA AT %QX0.0 : BOOL;
    EnableB AT %QX0.1 : BOOL;
    Conflict AT %QX0.2 : BOOL;
  END_VAR
  EnableA := RequestA AND NOT RequestB AND GuardClosed;
  EnableB := RequestB AND NOT RequestA AND GuardClosed;
  Conflict := RequestA AND RequestB;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : InterlockGeneral;
  END_RESOURCE
END_CONFIGURATION
