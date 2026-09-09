TYPE GeneralMode : (Idle, Ready, Running, Paused) := Idle; END_TYPE
PROGRAM StateMachineGeneral
  VAR
    Mode : GeneralMode := Idle;
  END_VAR
  VAR
    Prepare AT %IX0.0 : BOOL;
    Start AT %IX0.1 : BOOL;
    Pause AT %IX0.2 : BOOL;
    Reset AT %IX0.3 : BOOL;
    RunningOutput AT %QX0.0 : BOOL;
    Waiting AT %QX0.1 : BOOL;
  END_VAR
  IF Reset THEN Mode := Idle;
  ELSE
    CASE Mode OF
      Idle: IF Prepare THEN Mode := Ready; END_IF;
      Ready: IF Start THEN Mode := Running; END_IF;
      Running: IF Pause THEN Mode := Paused; END_IF;
      Paused: IF Start THEN Mode := Running; END_IF;
    END_CASE;
  END_IF;
  RunningOutput := Mode = Running;
  Waiting := Mode = Ready OR Mode = Paused;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : StateMachineGeneral;
  END_RESOURCE
END_CONFIGURATION
