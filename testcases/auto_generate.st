TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK FB_G4LTL
    VAR
        pb1 AT %IX0.0 : BOOL;
        led AT %QX0.1 : BOOL;
        led2 AT %QX0.0 : BOOL;
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
END_FUNCTION_BLOCK

PROGRAM program0
  VAR
    PB1 AT %IX0.0 : BOOL;
    LED2 AT %QX0.0 : BOOL;
    LED AT %QX0.1 : BOOL;
    fbInstance : FB_G4LTL;
  END_VAR

  fbInstance(pb1 := PB1);
  LED := fbInstance.led;
  LED2 := fbInstance.led2;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION