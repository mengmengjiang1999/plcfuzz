
TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

PROGRAM program0
   VAR
      pb1 AT %IX0.0 : BOOL;
      pb2 AT %IX0.1 : BOOL;
      pb3 AT %IX0.2 : BOOL;
      pb4 AT %IX0.3 : BOOL;
      pb5 AT %IX0.4 : BOOL;
      pb6 AT %IX0.5 : BOOL;
      pb7 AT %IX0.6 : BOOL;
      pb8 AT %IX0.7 : BOOL;
      pb9 AT %IX1.0 : BOOL;
      pb10 AT %IX1.1 : BOOL;
      pb11 AT %IX1.2 : BOOL;
      pb12 AT %IX1.3 : BOOL;
      led AT %QX0.0 : BOOL;
      led2 AT %QX0.1 : BOOL;
      led3 AT %QX0.2 : BOOL;
      led4 AT %QX0.3 : BOOL;
      led5 AT %QX0.4 : BOOL;
      led6 AT %QX0.5 : BOOL;
      led7 AT %QX0.6 : BOOL;
      led8 AT %QX0.7 : BOOL;
      led9 AT %QX1.0 : BOOL;
      cstate97 AT %QW1 : INT := 0;
   END_VAR

   (* Control logic *)
CASE cstate97 OF
0:
    IF (( TRUE )) THEN 
        cstate97 := 2; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
1:
    IF (( TRUE )) THEN 
        cstate97 := 2; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
2:
    IF (( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  (pb6 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate97 := 4; led := FALSE; led2 := TRUE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  (pb6 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate97 := 2; led := FALSE; led2 := TRUE; led3 := FALSE; led4 := FALSE; led5 := FALSE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
3:
    IF (( TRUE )) THEN 
        cstate97 := 1; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
4:
    IF (( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  (pb6 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate97 := 3; led := FALSE; led2 := TRUE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  (pb6 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate97 := 1; led := FALSE; led2 := TRUE; led3 := FALSE; led4 := FALSE; led5 := TRUE; led6 := FALSE; led7 := FALSE; led8 := FALSE; led9 := FALSE;  
    END_IF;
END_CASE;

END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
