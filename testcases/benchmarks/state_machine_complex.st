TYPE ComplexMode : (Idle, Preparing, Running, Paused, Completing, Complete) := Idle; END_TYPE
PROGRAM StateMachineComplex
  VAR
    Mode : ComplexMode := Idle;
  END_VAR
  VAR
    Start AT %IX0.0 : BOOL;
    Ready AT %IX0.1 : BOOL;
    Pause AT %IX0.2 : BOOL;
    Resume AT %IX0.3 : BOOL;
    Finish AT %IX0.4 : BOOL;
    Reset AT %IX0.5 : BOOL;
    Busy AT %QX0.0 : BOOL;
    Held AT %QX0.1 : BOOL;
    Done AT %QX0.2 : BOOL;
  END_VAR
  IF Reset THEN Mode := Idle;
  ELSE
    CASE Mode OF
      Idle: IF Start THEN Mode := Preparing; END_IF;
      Preparing: IF Ready THEN Mode := Running; END_IF;
      Running: IF Pause THEN Mode := Paused; ELSIF Finish THEN Mode := Completing; END_IF;
      Paused: IF Resume THEN Mode := Running; END_IF;
      Completing: Mode := Complete;
      Complete: Mode := Complete;
    END_CASE;
  END_IF;
  Busy := Mode = Preparing OR Mode = Running OR Mode = Completing;
  Held := Mode = Paused;
  Done := Mode = Complete;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : StateMachineComplex;
  END_RESOURCE
END_CONFIGURATION
