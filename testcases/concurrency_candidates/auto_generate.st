TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

PROGRAM program0
    VAR_INPUT
        pb1 : BOOL;
    END_VAR
    VAR_OUTPUT
        led : BOOL;
        led2 : BOOL;
    END_VAR
    VAR
        cstate92 : LINT := 0;
    END_VAR

  CASE cstate92 OF
    0:
      IF (TRUE) THEN 
        cstate92 := 1; 
        led := FALSE; 
        led2 := FALSE;  
      END_IF;
    1:
      IF (pb1 = FALSE) THEN 
        cstate92 := 1; 
        led := TRUE; 
        led2 := FALSE;  
      ELSIF (pb1 = TRUE) THEN 
        cstate92 := 2; 
        led := TRUE; 
        led2 := FALSE;  
      END_IF;
    2:
      IF (pb1 = FALSE) THEN 
        cstate92 := 3; 
        led := TRUE; 
        led2 := TRUE;  
      ELSIF (pb1 = TRUE) THEN 
        cstate92 := 4; 
        led := TRUE; 
        led2 := TRUE;  
      END_IF;
    3:
      IF (TRUE) THEN 
        cstate92 := 1; 
        led := FALSE; 
        led2 := FALSE;  
      END_IF;
    4:
      IF (TRUE) THEN 
        cstate92 := 3; 
        led := FALSE; 
        led2 := TRUE;  
      END_IF;
  END_CASE;
END_PROGRAM

CONFIGURATION Config0
  VAR_GLOBAL
    PB1 AT %IX0.0 : BOOL;
    LED2 AT %QX0.0 : BOOL;
    LED AT %QX0.1 : BOOL;
  END_VAR
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION