
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
      cstate42	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate42 OF
0:
    IF (( TRUE )) THEN 
        cstate42 := 3; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    END_IF;
1:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate42 := 2; led := TRUE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate42 := 4; led := TRUE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE;  
    END_IF;
2:
    IF (( TRUE )) THEN 
        cstate42 := 3; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    END_IF;
3:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate42 := 3; led := TRUE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate42 := 1; led := TRUE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE;  
    END_IF;
4:
    IF (( TRUE )) THEN 
        cstate42 := 2; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


CONFIGURATION Config0
  VAR_GLOBAL
    pb1 AT %IX0.0 : BOOL;
    pb2 AT %IX0.1 : BOOL;
    pb3 AT %IX0.2 : BOOL;
    led AT %QX0.0 : BOOL;
    led2 AT %QX0.1 : BOOL;
    led3 AT %QX0.2 : BOOL;
    led4 AT %QX0.3 : BOOL;
  END_VAR
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
