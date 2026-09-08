PROGRAM AccessDemo
  VAR_OUTPUT
    CurrentValue : INT;
  END_VAR
  CurrentValue := CurrentValue + 1;
END_PROGRAM

CONFIGURATION AccessConfig
  VAR_GLOBAL
    Setpoint : INT := 100;
  END_VAR

  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : AccessDemo;
  END_RESOURCE

  VAR_ACCESS
    RemoteSetpoint : Setpoint : INT READ_WRITE;
    MonitorValue : Res0.Instance0.CurrentValue : INT READ_ONLY;
  END_VAR
END_CONFIGURATION
