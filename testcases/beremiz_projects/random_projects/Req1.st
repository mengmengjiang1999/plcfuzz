
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      req1	: BOOL;
   END_VAR
   VAR_OUTPUT
      grant1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 1 *)
      cstate98	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate98 OF
0:
    IF ((req1 = FALSE)) THEN 
        cstate98 := 0; grant1 := FALSE;  
    ELSIF ((req1 = TRUE)) THEN 
        cstate98 := 0; grant1 := TRUE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


