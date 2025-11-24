PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    x2 AT %IX0.2 : BOOL;
    x3 AT %IX0.3 : BOOL;
    y0 AT %QX0.0 : BOOL;
    y1 AT %QX0.1 : BOOL;
  END_VAR
  VAR
    cstate67 : DINT := 0;
  END_VAR


  CASE cstate67 OF
  0:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate67 := 0; y0 := FALSE; y1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
          cstate67 := 1; y0 := FALSE; y1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = FALSE)) THEN 
          cstate67 := 0; y0 := FALSE; y1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate67 := 0; y0 := TRUE; y1 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate67 := 0; y0 := TRUE; y1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate67 := 0; y0 := TRUE; y1 := FALSE;  
      END_IF;
  1:
      IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate67 := 1; y0 := FALSE; y1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = FALSE)) THEN 
          cstate67 := 1; y0 := FALSE; y1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
          cstate67 := 1; y0 := FALSE; y1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate67 := 1; y0 := FALSE; y1 := FALSE;  
      END_IF;
  END_CASE;


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
