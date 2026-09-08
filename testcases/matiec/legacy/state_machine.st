TYPE
  MachineState : (Idle, Starting, Running, Fault) := Idle;
END_TYPE

PROGRAM StateMachine
  VAR
    CurrentState : MachineState := Idle;
  END_VAR
  VAR
    StartButton AT %IX0.0 : BOOL;
    StopButton AT %IX0.1 : BOOL;
    FaultSignal AT %IX0.2 : BOOL;
    RunningLamp AT %QX0.0 : BOOL;
    FaultLamp AT %QX0.1 : BOOL;
  END_VAR

  CASE CurrentState OF
    Idle:
      IF StartButton THEN
        CurrentState := Starting;
      END_IF;
    Starting:
      IF FaultSignal THEN
        CurrentState := Fault;
      ELSE
        CurrentState := Running;
      END_IF;
    Running:
      IF FaultSignal THEN
        CurrentState := Fault;
      ELSIF StopButton THEN
        CurrentState := Idle;
      END_IF;
    Fault:
      IF NOT FaultSignal THEN
        CurrentState := Idle;
      END_IF;
  END_CASE;

  RunningLamp := CurrentState = Running;
  FaultLamp := CurrentState = Fault;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : StateMachine;
  END_RESOURCE
END_CONFIGURATION
