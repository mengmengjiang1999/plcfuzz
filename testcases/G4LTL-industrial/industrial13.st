PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    c1_geq10 AT %IX0.2 : BOOL;
    y0 AT %QX0.0 : BOOL;
    c1_reset AT %QX0.1 : BOOL;
    c1_add1 AT %QX0.2 : BOOL;
  END_VAR
  VAR
    cstate14 : DINT := 0;
  END_VAR

  CASE cstate14 OF
  11:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 3; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 11; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  12:
      IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 12; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 13; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  13:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 13; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 12; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      END_IF;
  0:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 13; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 12; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  1:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  2:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 11; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 3; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  3:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 11; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 3; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  4:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  5:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 6; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 8; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  6:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 6; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 8; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  7:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  8:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 8; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 6; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      END_IF;
  9:
      IF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
          cstate14 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
      END_IF;
  10:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (c1_geq10 = FALSE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
          cstate14 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
      END_IF;
  END_CASE;


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
