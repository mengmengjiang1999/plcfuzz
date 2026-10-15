
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x1	: BOOL;
   END_VAR
   VAR_OUTPUT
      y1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 7 *)
      cstate58	: LINT := 0;
      t	: TON;
      t_reset	: BOOL := FALSE;
      t_up	: BOOL := FALSE;
      t_start	: BOOL := FALSE;
   END_VAR

   (* Constant definition (depending on compiler, one might need to move to normal variables) *)

   (* Each time constant has a difference of 1 period (cycle-time); please substract it when needed  *)
   VAR CONST
      T_VALUE	: TIME := TIME#3s;
   END_VAR

   (* Control logic *)
CASE cstate58 OF
0:
    IF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 2; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 2; y1 := TRUE; t_start := FALSE; 
    END_IF;
1:
    IF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 2; y1 := TRUE; t_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 1; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 5; y1 := FALSE; t_start := FALSE; 
    END_IF;
2:
    IF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 2; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 2; y1 := TRUE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    END_IF;
3:
    IF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 3; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 4; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 2; y1 := TRUE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    END_IF;
4:
    IF ((x1 = FALSE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 4; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 3; y1 := FALSE; t_start := TRUE; t_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 1; y1 := TRUE; t_start := TRUE; t_up := FALSE; 
    END_IF;
5:
    IF ((x1 = FALSE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = FALSE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 5; y1 := FALSE; t_start := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 1; y1 := TRUE; t_start := TRUE; t_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 3; y1 := FALSE; t_start := TRUE; t_up := FALSE; 
    END_IF;
6:
    IF ((x1 = TRUE) AND  (t.Q = TRUE)) THEN 
        cstate58 := 1; y1 := TRUE; t_start := TRUE; t_up := FALSE; 
    ELSIF ((x1 = TRUE) AND  (t.Q = FALSE)) THEN 
        cstate58 := 3; y1 := FALSE; t_start := TRUE; t_up := FALSE; 
    ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
        cstate58 := 6; y1 := FALSE; t_start := FALSE; 
    END_IF;
END_CASE;

(* Additional processing to handle clocks - in CODESYS, it only starts
    with rising edge and can not be placed inside IF statement *) 
IF(t_up = TRUE) THEN
    t_reset := TRUE;
ELSIF(t_start = TRUE AND t_up = FALSE) THEN
    t_up := TRUE;  t_reset := FALSE;
END_IF
t(IN:=t_reset, PT:=T_VALUE); 

END_FUNCTION_BLOCK


