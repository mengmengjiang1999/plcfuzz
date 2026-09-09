PROGRAM SequentialControlComplex
  VAR
    SequenceIndex : INT := 0;
  END_VAR
  VAR
    Start AT %IX0.0 : BOOL;
    Loaded AT %IX0.1 : BOOL;
    Processed AT %IX0.2 : BOOL;
    Inspected AT %IX0.3 : BOOL;
    Released AT %IX0.4 : BOOL;
    Hold AT %IX0.5 : BOOL;
    Reset AT %IX0.6 : BOOL;
    Loading AT %QX0.0 : BOOL;
    Processing AT %QX0.1 : BOOL;
    Inspecting AT %QX0.2 : BOOL;
    Releasing AT %QX0.3 : BOOL;
    Complete AT %QX0.4 : BOOL;
  END_VAR
  IF Reset THEN SequenceIndex := 0;
  ELSIF NOT Hold THEN
    CASE SequenceIndex OF
      0: IF Start THEN SequenceIndex := 1; END_IF;
      1: IF Loaded THEN SequenceIndex := 2; END_IF;
      2: IF Processed THEN SequenceIndex := 3; END_IF;
      3: IF Inspected THEN SequenceIndex := 4; END_IF;
      4: IF Released THEN SequenceIndex := 5; END_IF;
      5: SequenceIndex := 5;
    END_CASE;
  END_IF;
  Loading := SequenceIndex = 1;
  Processing := SequenceIndex = 2;
  Inspecting := SequenceIndex = 3;
  Releasing := SequenceIndex = 4;
  Complete := SequenceIndex = 5;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : SequentialControlComplex;
  END_RESOURCE
END_CONFIGURATION
