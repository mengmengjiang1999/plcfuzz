PROGRAM program0
  VAR
    cstate44 : DINT;
  END_VAR
  VAR
    led AT %QX0.1 : BOOL;
    led2 AT %QX0.2 : BOOL;
    led3 AT %QX0.3 : BOOL;
    led4 AT %QX0.4 : BOOL;
    pb1 AT %IX0.1 : BOOL;
    pb2 AT %IX0.2 : BOOL;
    pb3 AT %IX0.3 : BOOL;
    pb4 AT %IX0.4 : BOOL;
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

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
