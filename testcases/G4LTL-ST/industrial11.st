PROGRAM program0
  VAR
    x1 AT %IX0.1 : BOOL;
    x2 AT %IX0.2 : BOOL;
    y1 AT %QX0.0 : BOOL;
    y2 AT %QX0.1 : BOOL;
    y0 AT %QX0.2 : BOOL;
  END_VAR
  VAR
    cstate73 : LINT := 0;
  END_VAR


  CASE cstate73 OF
  0:
      IF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
          cstate73 := 1; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x1 = FALSE) AND  (x2 = FALSE)) THEN 
          cstate73 := 2; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
          cstate73 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  1:
      IF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
          cstate73 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
          cstate73 := 1; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  2:
      IF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
          cstate73 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
          cstate73 := 1; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x1 = FALSE) AND  (x2 = FALSE)) THEN 
          cstate73 := 2; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  3:
      IF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
          cstate73 := 4; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF (( TRUE ) AND  (x2 = FALSE)) THEN 
          cstate73 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  4:
      IF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
          cstate73 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
          cstate73 := 4; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  5:
      IF ((x1 = FALSE) AND  (x2 = FALSE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
          cstate73 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
          cstate73 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
          cstate73 := 4; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  END_CASE;

END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
