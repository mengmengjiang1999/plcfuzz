PROGRAM InterlockComplex
  VAR
    Selected : INT := 0;
  END_VAR
  VAR
    RequestA AT %IX0.0 : BOOL;
    RequestB AT %IX0.1 : BOOL;
    RequestC AT %IX0.2 : BOOL;
    Permit AT %IX0.3 : BOOL;
    EnableA AT %QX0.0 : BOOL;
    EnableB AT %QX0.1 : BOOL;
    EnableC AT %QX0.2 : BOOL;
    Waiting AT %QX0.3 : BOOL;
  END_VAR
  IF NOT Permit THEN Selected := 0;
  ELSIF Selected = 0 THEN
    IF RequestA THEN Selected := 1;
    ELSIF RequestB THEN Selected := 2;
    ELSIF RequestC THEN Selected := 3;
    END_IF;
  ELSIF (Selected = 1 AND NOT RequestA) OR (Selected = 2 AND NOT RequestB) OR (Selected = 3 AND NOT RequestC) THEN
    Selected := 0;
  END_IF;
  EnableA := Selected = 1;
  EnableB := Selected = 2;
  EnableC := Selected = 3;
  Waiting := Permit AND Selected = 0 AND (RequestA OR RequestB OR RequestC);
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK MainTask(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM Instance0 WITH MainTask : InterlockComplex;
  END_RESOURCE
END_CONFIGURATION
