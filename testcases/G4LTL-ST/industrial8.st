PROGRAM program0
  VAR
    x1 AT %IX0.1 : BOOL;
    y1 AT %QX0.0 : BOOL;
  END_VAR
  VAR
    cstate13 : LINT := 0;
    t1_reset : BOOL := FALSE;
    t0_reset : BOOL := FALSE;
    t0_up : BOOL := FALSE;
    t1_up : BOOL := FALSE;
    t0 : TON;
    t1 : DINT;
    t0_start : BOOL := FALSE;
    t1_start : BOOL := FALSE;
  END_VAR


  CASE cstate13 OF
  11:
      IF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 10; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 11; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  12:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  13:
      IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  14:
      IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 12; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 15; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      END_IF;
  15:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 12; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 15; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  16:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      END_IF;
  17:
      IF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 7; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  0:
      IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 17; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 2; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 13; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 5; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  1:
      IF (( TRUE )) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  2:
      IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  3:
      IF ((x1 = FALSE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 11; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 10; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  4:
      IF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      END_IF;
  5:
      IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 7; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  6:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 7; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      END_IF;
  7:
      IF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 7; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      END_IF;
  8:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 12; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 15; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
      END_IF;
  9:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 10; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 11; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      END_IF;
  10:
      IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
          cstate13 := 7; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
          cstate13 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = TRUE)) THEN 
          cstate13 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t0.Q = FALSE)) THEN 
          cstate13 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
      END_IF;
  END_CASE;

  (* Additional processing to handle clocks - in CODESYS, it only starts
      with rising edge and can not be placed inside IF statement *) 
  IF(t0_up = TRUE) THEN
      t0_reset := TRUE;
  ELSIF(t0_start = TRUE AND t0_up = FALSE) THEN
      t0_up := TRUE;  t0_reset := FALSE;
  END_IF;
  t0(IN:=t0_reset, PT:=T#3ms); 
  IF(t1_up = TRUE) THEN
      t1_reset := TRUE;
  ELSIF(t1_start = TRUE AND t1_up = FALSE) THEN
      t1_up := TRUE;  t1_reset := FALSE;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
