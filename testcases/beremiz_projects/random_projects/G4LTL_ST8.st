
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x1	: BOOL;
   END_VAR
   VAR_OUTPUT
      y1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 18 *)
      cstate83	: LINT := 0;
      t0	: TON;
      t0_reset	: BOOL := FALSE;
      t0_up	: BOOL := FALSE;
      t0_start	: BOOL := FALSE;
      t1	: TON;
      t1_reset	: BOOL := FALSE;
      t1_up	: BOOL := FALSE;
      t1_start	: BOOL := FALSE;
   END_VAR

   (* Constant definition (depending on compiler, one might need to move to normal variables) *)

   (* Each time constant has a difference of 1 period (cycle-time); please substract it when needed  *)
   VAR CONST
      T0_VALUE	: TIME := TIME#5s;
      T1_VALUE	: TIME := TIME#3s;
   END_VAR

   (* Control logic *)
CASE cstate83 OF
11:
    IF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 10; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 11; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
12:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
13:
    IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
14:
    IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 12; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 15; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    END_IF;
15:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 12; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 15; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
16:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    END_IF;
17:
    IF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 7; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
0:
    IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 17; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 2; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 13; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 5; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
1:
    IF (( TRUE )) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
2:
    IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
3:
    IF ((x1 = FALSE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 11; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 10; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
4:
    IF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 4; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 16; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    END_IF;
5:
    IF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 7; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
6:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 7; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    END_IF;
7:
    IF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 7; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    END_IF;
8:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 9; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 12; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 15; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 3; y1 := FALSE; t0_start := TRUE; t0_up := FALSE;t1_start := FALSE; 
    END_IF;
9:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 10; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 1; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 11; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t0.Q = TRUE) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    END_IF;
10:
    IF ((x1 = TRUE) AND  (t0.Q = TRUE) AND  ( TRUE )) THEN 
        cstate83 := 7; y1 := TRUE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t0.Q = FALSE) AND  ( TRUE )) THEN 
        cstate83 := 6; y1 := FALSE; t0_start := FALSE;t1_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = TRUE)) THEN 
        cstate83 := 14; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE ) AND  (t1.Q = FALSE)) THEN 
        cstate83 := 8; y1 := TRUE; t0_start := FALSE;t1_start := TRUE; t1_up := FALSE; 
    END_IF;
END_CASE;

(* Additional processing to handle clocks - in CODESYS, it only starts
    with rising edge and can not be placed inside IF statement *) 
IF(t0_up = TRUE) THEN
    t0_reset := TRUE;
ELSIF(t0_start = TRUE AND t0_up = FALSE) THEN
    t0_up := TRUE;  t0_reset := FALSE;
END_IF
t0(IN:=t0_reset, PT:=T0_VALUE); 
IF(t1_up = TRUE) THEN
    t1_reset := TRUE;
ELSIF(t1_start = TRUE AND t1_up = FALSE) THEN
    t1_up := TRUE;  t1_reset := FALSE;
END_IF
t1(IN:=t1_reset, PT:=T1_VALUE); 

END_FUNCTION_BLOCK


