PROGRAM SequentialControlSimple
  VAR
    SequenceIndex : INT := 0;
  END_VAR
  VAR
    Advance AT %IX0.0 : BOOL;
    Reset AT %IX0.1 : BOOL;
    First AT %QX0.0 : BOOL;
    Second AT %QX0.1 : BOOL;
  END_VAR
  IF Reset THEN SequenceIndex := 0;
  ELSIF Advance THEN SequenceIndex := 1;
  END_IF;
  First := SequenceIndex = 0;
  Second := SequenceIndex = 1;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : SequentialControlSimple;
  END_RESOURCE
END_CONFIGURATION
