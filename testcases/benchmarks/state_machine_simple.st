PROGRAM StateMachineSimple
  VAR
    ActiveState : BOOL := FALSE;
  END_VAR
  VAR
    Start AT %IX0.0 : BOOL;
    Stop AT %IX0.1 : BOOL;
    Active AT %QX0.0 : BOOL;
  END_VAR
  IF Stop THEN ActiveState := FALSE;
  ELSIF Start THEN ActiveState := TRUE;
  END_IF;
  Active := ActiveState;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : StateMachineSimple;
  END_RESOURCE
END_CONFIGURATION
