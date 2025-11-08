TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE


PROGRAM program0
   VAR_INPUT
    pb1 : BOOL;
    pb2 : BOOL;
    pb3 : BOOL;
   END_VAR
    VAR_OUTPUT
    led : BOOL;
    led2 : BOOL;
    led3 : BOOL;
    led4 : BOOL;
 END_VAR
    VAR
    cstate44 : INT := 0;
   END_VAR

CASE cstate44 OF
0:
    IF (( TRUE )) THEN 
        cstate44 := 1; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE;  
    END_IF;
1:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate44 := 1; led := TRUE; led2 := FALSE; led3 := FALSE; led4 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate44 := 3; led := TRUE; led2 := FALSE; led3 := FALSE; led4 := FALSE;  
    END_IF;
2:
    IF (( TRUE )) THEN 
        cstate44 := 1; led := FALSE; led2 := FALSE; led3 := FALSE; led4 := FALSE;  
    END_IF;
3:
    IF ((pb1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate44 := 2; led := TRUE; led2 := TRUE; led3 := FALSE; led4 := FALSE;  
    ELSIF ((pb1 = TRUE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate44 := 4; led := TRUE; led2 := TRUE; led3 := FALSE; led4 := FALSE;  
    END_IF;
4:
    IF (( TRUE )) THEN 
        cstate44 := 2; led := FALSE; led2 := TRUE; led3 := FALSE; led4 := FALSE;  
    END_IF;
END_CASE;

END_PROGRAM

CONFIGURATION Config0
  VAR_GLOBAL
    INPUT00 AT %IX0.0 : BOOL;
    INPUT01 AT %IX0.1 : BOOL;
    INPUT02 AT %IX0.2 : BOOL;
    OUTPUT00 AT %QX0.0 : BOOL;
    OUTPUT01 AT %QX0.1 : BOOL;
    OUTPUT02 AT %QX0.2 : BOOL;
    OUTPUT03 AT %QX0.3 : BOOL;
  END_VAR
  RESOURCE Res0 ON PLC
    task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0(pb1 := INPUT00, pb2 := INPUT01, pb3 := INPUT02, led := OUTPUT00, led2 := OUTPUT01, led3 := OUTPUT02, led4 := OUTPUT03);
  END_RESOURCE
END_CONFIGURATION
