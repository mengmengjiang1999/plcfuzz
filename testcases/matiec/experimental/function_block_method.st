FUNCTION_BLOCK Accumulator
  VAR
    Total : INT := 0;
  END_VAR

  Total := Total;

  METHOD PUBLIC Add : INT
    VAR_INPUT
      Delta : INT;
    END_VAR
    Total := Total + Delta;
    Add := Total;
  END_METHOD
END_FUNCTION_BLOCK

PROGRAM MethodDemo
  VAR
    Instance : Accumulator;
    Result : INT;
  END_VAR

  Result := Instance.Add(Delta := 2);
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : MethodDemo;
  END_RESOURCE
END_CONFIGURATION
