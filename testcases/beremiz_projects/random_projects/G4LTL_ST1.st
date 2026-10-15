FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 1 *)
      cstate0	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate0 OF
0:
    IF ((x0 = FALSE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE)) THEN 
        cstate0 := 0; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE)) THEN 
        cstate0 := 0; y0 := TRUE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK