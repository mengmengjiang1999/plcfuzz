
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
      pb8	: BOOL;
      pb9	: BOOL;
      pb10	: BOOL;
      pb11	: BOOL;
      pb12	: BOOL;
   END_VAR
   VAR_OUTPUT
      led	: BOOL;
      led2	: BOOL;
      led3	: BOOL;
      led4	: BOOL;
      led5	: BOOL;
      led6	: BOOL;
      led7	: BOOL;
      led8	: BOOL;
      led9	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 5 *)
      cstate81	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate81 OF
0:
    IF (( TRUE )) THEN 
        cstate81 := 1; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
1:
    IF (( TRUE ) AND  (pb2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate81 := 1; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    ELSIF (( TRUE ) AND  (pb2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate81 := 2; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
2:
    IF (( TRUE ) AND  (pb2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate81 := 4; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    ELSIF (( TRUE ) AND  (pb2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate81 := 3; led := FALSE; led2 := FALSE; led3 := TRUE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
3:
    IF (( TRUE )) THEN 
        cstate81 := 4; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
4:
    IF (( TRUE )) THEN 
        cstate81 := 1; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
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
