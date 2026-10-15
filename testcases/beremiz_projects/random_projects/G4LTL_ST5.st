
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      c1_geq500	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      c1_add1	: BOOL;
      c1_reset	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 4 *)
      cstate69	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate69 OF
0:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate69 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 2; y0 := TRUE; c1_add1 := TRUE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 2; y0 := FALSE; c1_add1 := TRUE; c1_reset := FALSE;  
    END_IF;
1:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate69 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (c1_geq500 = FALSE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (c1_geq500 = TRUE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    END_IF;
2:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate69 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 2; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 2; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    END_IF;
3:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 3; y0 := FALSE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 3; y0 := TRUE; c1_add1 := FALSE; c1_reset := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate69 := 1; y0 := FALSE; c1_add1 := FALSE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = FALSE)) THEN 
        cstate69 := 2; y0 := FALSE; c1_add1 := TRUE; c1_reset := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq500 = TRUE)) THEN 
        cstate69 := 2; y0 := TRUE; c1_add1 := TRUE; c1_reset := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


