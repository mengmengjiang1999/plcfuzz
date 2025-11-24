PROGRAM program0
  VAR
    req1 AT %IX0.1 : BOOL;
    grant1 AT %QX0.0 : BOOL;
  END_VAR
  VAR
    cstate78 : LINT := 0;
  END_VAR

  CASE cstate78 OF
  0:
      IF ((req1 = FALSE)) THEN 
          cstate78 := 0; grant1 := FALSE;  
      ELSIF ((req1 = TRUE)) THEN 
          cstate78 := 0; grant1 := TRUE;  
      END_IF;
  END_CASE;


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
