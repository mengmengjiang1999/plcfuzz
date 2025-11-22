PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    x2 AT %IX0.2 : BOOL;
    x3 AT %IX0.3 : BOOL;
    y0 AT %QX0.0 : BOOL;
  END_VAR
  VAR
    cstate92 : DINT := 0;
  END_VAR

  CASE cstate92 OF
  22:
      IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 247; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 246; y0 := TRUE;  
      ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      END_IF;
  0:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 0; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 24; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 27; y0 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 18; y0 := FALSE;  
      END_IF;
  243:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF (( TRUE ) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 24; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 243; y0 := TRUE;  
      END_IF;
  24:
      IF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF (( TRUE ) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 243; y0 := TRUE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 24; y0 := FALSE;  
      END_IF;
  246:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 246; y0 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 786; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 247; y0 := FALSE;  
      END_IF;
  27:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 24; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 27; y0 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 18; y0 := FALSE;  
      END_IF;
  247:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 786; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 247; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 246; y0 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      END_IF;
  786:
      IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 247; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 786; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 246; y0 := TRUE;  
      ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      END_IF;
  28:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      ELSIF (( TRUE ) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 24; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 243; y0 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      END_IF;
  29:
      IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 247; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 246; y0 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
          cstate92 := 22; y0 := FALSE;  
      END_IF;
  18:
      IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 27; y0 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 18; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      END_IF;
  20:
      IF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
          cstate92 := 29; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
          cstate92 := 22; y0 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
          cstate92 := 20; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 28; y0 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
          cstate92 := 243; y0 := TRUE;  
      END_IF;
  END_CASE;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
