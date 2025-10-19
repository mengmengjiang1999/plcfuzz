
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
   END_VAR
   VAR
   (* The total number of states equals to 5 *)
      cstate20	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate20 OF
0:
    IF (( TRUE )) THEN 
        cstate20 := 3; led := FALSE; led2 := FALSE; led3 := FALSE;  
    END_IF;
1:
    IF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate20 := 2; led := TRUE; led2 := TRUE; led3 := FALSE;  
    ELSIF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate20 := 4; led := TRUE; led2 := TRUE; led3 := FALSE;  
    END_IF;
2:
    IF (( TRUE )) THEN 
        cstate20 := 4; led := FALSE; led2 := TRUE; led3 := FALSE;  
    END_IF;
3:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate20 := 3; led := TRUE; led2 := FALSE; led3 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate20 := 1; led := TRUE; led2 := FALSE; led3 := FALSE;  
    END_IF;
4:
    IF (( TRUE )) THEN 
        cstate20 := 3; led := FALSE; led2 := FALSE; led3 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


