
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      x2	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      y1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 100 *)
      cstate43	: LINT := 0;
      t0	: TON;
      t0_reset	: BOOL := FALSE;
      t0_up	: BOOL := FALSE;
      t0_start	: BOOL := FALSE;
   END_VAR

   (* Constant definition (depending on compiler, one might need to move to normal variables) *)

   (* Each time constant has a difference of 1 period (cycle-time); please substract it when needed  *)
   VAR CONST
      T0_VALUE	: TIME := TIME#7s;
   END_VAR

   (* Control logic *)
CASE cstate43 OF
88:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
89:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 89; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 75; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
90:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
91:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 91; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
92:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 71; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 92; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
93:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 79; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
94:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 94; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 43; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
95:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
96:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 50; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
97:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 97; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
10:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
98:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
11:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 3; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
99:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
12:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 3; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
13:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
14:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
15:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 72; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
16:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
17:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
18:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
19:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 91; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
0:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
1:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 48; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
2:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
3:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 3; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 51; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
4:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
5:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
6:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
7:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 81; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 79; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
8:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 54; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
9:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
20:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
21:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
22:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
23:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
24:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
25:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
26:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
27:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 27; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 50; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
28:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
29:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
30:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
31:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 75; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
32:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
33:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 97; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
34:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
35:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 27; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 50; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
36:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
37:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 84; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
38:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
39:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
40:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 40; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
41:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 75; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
42:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
43:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 94; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 43; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
44:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
45:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
46:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 3; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 51; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
47:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
48:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 48; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
49:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 48; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
50:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 50; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 27; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
51:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 3; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 51; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
52:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 43; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
53:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
54:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 54; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
55:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
56:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
57:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 94; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 43; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
58:
    IF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
59:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
60:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 50; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
61:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
62:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 92; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 71; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
63:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
64:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
65:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 92; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
66:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 80; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
67:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 43; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
68:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
69:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
70:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
71:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 71; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 92; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
72:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 72; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
73:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
74:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
75:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 75; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 89; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
76:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 40; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
77:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 89; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 75; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
78:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
79:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 81; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 79; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
80:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 80; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
81:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 81; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 79; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
82:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
83:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
84:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 84; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
85:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 92; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
86:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 79; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
87:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate43 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate43 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
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

END_FUNCTION_BLOCK


