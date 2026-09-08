TYPE
  SampleWindow : ARRAY [0..3] OF INT;
  ControllerData : STRUCT
    Setpoint : INT;
    Samples : SampleWindow;
  END_STRUCT;
END_TYPE

PROGRAM StructuredValues
  VAR
    Index : INT := 0;
    Data : ControllerData := (
      Setpoint := 100,
      Samples := [0, 0, 0, 0]
    );
  END_VAR
  VAR
    InputValue AT %IW0 : INT;
    OutputValue AT %QW0 : INT;
  END_VAR

  Data.Samples[Index] := InputValue;
  OutputValue := Data.Samples[Index] + Data.Setpoint;

  Index := Index + 1;
  IF Index > 3 THEN
    Index := 0;
  END_IF;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : StructuredValues;
  END_RESOURCE
END_CONFIGURATION
