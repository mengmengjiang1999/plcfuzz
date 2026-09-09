PROGRAM SequentialControlGeneral
  VAR
    SequenceIndex : INT := 0;
  END_VAR
  VAR
    Start AT %IX0.0 : BOOL;
    Station1Done AT %IX0.1 : BOOL;
    Station2Done AT %IX0.2 : BOOL;
    Reset AT %IX0.3 : BOOL;
    Station1 AT %QX0.0 : BOOL;
    Station2 AT %QX0.1 : BOOL;
    Complete AT %QX0.2 : BOOL;
  END_VAR
  IF Reset THEN SequenceIndex := 0;
  ELSE
    CASE SequenceIndex OF
      0: IF Start THEN SequenceIndex := 1; END_IF;
      1: IF Station1Done THEN SequenceIndex := 2; END_IF;
      2: IF Station2Done THEN SequenceIndex := 3; END_IF;
      3: SequenceIndex := 3;
    END_CASE;
  END_IF;
  Station1 := SequenceIndex = 1;
  Station2 := SequenceIndex = 2;
  Complete := SequenceIndex = 3;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : SequentialControlGeneral;
  END_RESOURCE
END_CONFIGURATION
