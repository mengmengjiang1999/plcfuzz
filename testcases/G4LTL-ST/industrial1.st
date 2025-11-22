PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    y0 AT %QX0.0 : BOOL;
  END_VAR
  VAR
    cstate74 : DINT := 0;
  END_VAR


  CASE cstate74 OF
  0:
      IF ((x0 = FALSE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE)) THEN 
          cstate74 := 0; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE)) THEN 
          cstate74 := 0; y0 := TRUE;  
      END_IF;
  END_CASE;



END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
