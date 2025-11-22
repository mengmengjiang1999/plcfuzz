PROGRAM program0
  VAR
    cstate44 : DINT;
  END_VAR
  VAR
    led AT %QX0.1 : BOOL;
    led2 AT %QX0.2 : BOOL;
    led3 AT %QX0.3 : BOOL;
    led4 AT %QX0.4 : BOOL;
    led5 AT %QX0.5 : BOOL;
    led6 AT %QX0.6 : BOOL;
    led7 AT %QX0.7 : BOOL;
    led8 AT %QX0.8 : BOOL;
    led9 AT %QX0.9 : BOOL;
    led10 AT %QX0.10 : BOOL;
    led11 AT %QX0.11 : BOOL;
    led12 AT %QX0.12 : BOOL;
    led13 AT %QX0.13 : BOOL;
    led14 AT %QX0.14 : BOOL;
    led15 AT %QX0.15 : BOOL;
    led16 AT %QX0.16 : BOOL;
    led17 AT %QX0.17 : BOOL;
    led18 AT %QX0.18 : BOOL;
    led19 AT %QX0.19 : BOOL;
    led20 AT %QX0.20 : BOOL;
    led21 AT %QX0.21 : BOOL;
    led22 AT %QX0.22 : BOOL;
    led23 AT %QX0.23 : BOOL;
    led24 AT %QX0.24 : BOOL;
    led25 AT %QX0.25 : BOOL;
    led26 AT %QX0.26 : BOOL;
    led27 AT %QX0.27 : BOOL;
    led28 AT %QX0.28 : BOOL;
    led29 AT %QX0.29 : BOOL;
    led30 AT %QX0.30 : BOOL;
    led31 AT %QX0.31 : BOOL;
    led32 AT %QX0.32 : BOOL;
    led33 AT %QX0.33 : BOOL;
    led34 AT %QX0.34 : BOOL;
    led35 AT %QX0.35 : BOOL;
    led36 AT %QX0.36 : BOOL;
    pb1 AT %IX0.1 : BOOL;
    pb2 AT %IX0.2 : BOOL;
    pb3 AT %IX0.3 : BOOL;
    pb4 AT %IX0.4 : BOOL;
    pb5 AT %IX0.5 : BOOL;
    pb6 AT %IX0.6 : BOOL;
    pb7 AT %IX0.7 : BOOL;
    pb8 AT %IX0.8 : BOOL;
    pb9 AT %IX0.9 : BOOL;
    pb10 AT %IX0.10 : BOOL;
    pb11 AT %IX0.11 : BOOL;
    pb12 AT %IX0.12 : BOOL;
    pb13 AT %IX0.13 : BOOL;
    pb14 AT %IX0.14 : BOOL;
    pb15 AT %IX0.15 : BOOL;
    pb16 AT %IX0.16 : BOOL;
    pb17 AT %IX0.17 : BOOL;
    pb18 AT %IX0.18 : BOOL;
    pb19 AT %IX0.19 : BOOL;
    pb20 AT %IX0.20 : BOOL;
    pb21 AT %IX0.21 : BOOL;
    pb22 AT %IX0.22 : BOOL;
    pb23 AT %IX0.23 : BOOL;
    pb24 AT %IX0.24 : BOOL;
    pb25 AT %IX0.25 : BOOL;
    pb26 AT %IX0.26 : BOOL;
    pb27 AT %IX0.27 : BOOL;
    pb28 AT %IX0.28 : BOOL;
    pb29 AT %IX0.29 : BOOL;
    pb30 AT %IX0.30 : BOOL;
    pb31 AT %IX0.31 : BOOL;
    pb32 AT %IX0.32 : BOOL;
    pb33 AT %IX0.33 : BOOL;
    pb34 AT %IX0.34 : BOOL;
    pb35 AT %IX0.35 : BOOL;
    pb36 AT %IX0.36 : BOOL;
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
