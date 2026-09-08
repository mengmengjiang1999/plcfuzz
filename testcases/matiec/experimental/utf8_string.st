PROGRAM Utf8Status
  VAR
    StatusMessage : STRING := '设备就绪🚀';
  END_VAR

  StatusMessage := StatusMessage;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : Utf8Status;
  END_RESOURCE
END_CONFIGURATION
