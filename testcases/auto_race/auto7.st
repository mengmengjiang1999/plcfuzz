
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      pb1	: BOOL;
      pb2	: BOOL;
      pb3	: BOOL;
      pb4	: BOOL;
      pb5	: BOOL;
      pb6	: BOOL;
      pb7	: BOOL;
   END_VAR
   VAR_OUTPUT
      led	: BOOL;
      led2	: BOOL;
      led3	: BOOL;
      led4	: BOOL;
      led5	: BOOL;
      led6	: BOOL;
      led7	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 5 *)
      cstate37	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate37 OF
0:
    IF (( TRUE )) THEN 
        cstate37 := 2; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    END_IF;
1:
    IF (( TRUE )) THEN 
        cstate37 := 2; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    END_IF;
2:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate37 := 2; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate37 := 4; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    END_IF;
3:
    IF (( TRUE )) THEN 
        cstate37 := 1; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE;  
    END_IF;
4:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate37 := 1; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate37 := 3; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


