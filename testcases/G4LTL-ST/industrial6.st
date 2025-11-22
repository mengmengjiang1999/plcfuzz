PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    c1_geq500 AT %IX0.2 : BOOL;
    y0 AT %QX0.0 : BOOL;
    c1_add1 AT %QX0.1 : BOOL;
    c1_reset AT %QX0.2 : BOOL;
  END_VAR
  VAR
    cstate23 : DINT := 0;
  END_VAR

   (* Control logic *)
CASE cstate23 OF
0:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 2; y0 := TRUE; c1_add1 := TRUE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 2; y0 := FALSE; c1_add1 := TRUE; c1_reset := FALSE;  
    END_IF;
1:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (c1_geq500 = FALSE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (c1_geq500 = TRUE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    END_IF;
2:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 2; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 2; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    END_IF;
3:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate23 := 2; y0 := FALSE; c1_add1 := TRUE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate23 := 2; y0 := TRUE; c1_add1 := TRUE; c1_reset := FALSE;  
    END_IF;
END_CASE;


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
