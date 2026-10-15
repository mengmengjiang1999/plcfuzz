
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      x2	: BOOL;
      x3	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      y1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 2 *)
      cstate29	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate29 OF
0:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate29 := 0; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate29 := 1; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = FALSE)) THEN 
        cstate29 := 0; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate29 := 0; y0 := TRUE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate29 := 0; y0 := TRUE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate29 := 0; y0 := TRUE; y1 := FALSE;  
    END_IF;
1:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate29 := 1; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = FALSE)) THEN 
        cstate29 := 1; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate29 := 1; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate29 := 1; y0 := FALSE; y1 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


