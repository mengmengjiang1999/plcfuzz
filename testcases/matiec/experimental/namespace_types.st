NAMESPACE Factory.Motion
TYPE
  Speed : INT;
END_TYPE

FUNCTION ClampSpeed : Speed
  VAR_INPUT
    Value : Speed;
  END_VAR
  ClampSpeed := LIMIT(0, Value, 3000);
END_FUNCTION
END_NAMESPACE

PROGRAM NamespaceDemo
  VAR
    Requested : Factory.Motion.Speed := 3200;
    Applied : Factory.Motion.Speed;
  END_VAR

  Applied := Factory.Motion.ClampSpeed(Requested);
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : NamespaceDemo;
  END_RESOURCE
END_CONFIGURATION
