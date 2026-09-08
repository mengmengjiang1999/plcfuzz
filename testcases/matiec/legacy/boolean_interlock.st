PROGRAM BooleanInterlock
  VAR
    StartButton AT %IX0.0 : BOOL;
    StopButton AT %IX0.1 : BOOL;
    MotorEnabled AT %QX0.0 : BOOL;
  END_VAR

  MotorEnabled := StartButton AND NOT StopButton;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : BooleanInterlock;
  END_RESOURCE
END_CONFIGURATION
