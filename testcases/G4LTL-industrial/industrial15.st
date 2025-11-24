PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    x2 AT %IX0.2 : BOOL;
    y0 AT %QX0.0 : BOOL;
    y1 AT %QX0.1 : BOOL;
  END_VAR
  VAR
    cstate90 : DINT := 0;
    t0 : TON;
    t0_reset : BOOL := FALSE;
    t0_up : BOOL := FALSE;
    t0_start : BOOL := FALSE;
  END_VAR


   (* Control logic *)
CASE cstate90 OF
88:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
89:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 89; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 75; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
90:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
91:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 91; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
92:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 71; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 92; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
93:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 79; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
94:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 94; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 43; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
95:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
96:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 50; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
97:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 97; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
10:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
98:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
11:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 3; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
99:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
12:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 3; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
13:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
14:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
15:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 72; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
16:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
17:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
18:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
19:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 91; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
0:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
1:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 48; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
2:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
3:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 3; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 51; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
4:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
5:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
6:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
7:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 81; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 79; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
8:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 54; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
9:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
20:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
21:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
22:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
23:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
24:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
25:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
26:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
27:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 27; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 50; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
28:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
29:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
30:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
31:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 75; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
32:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
33:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 97; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
34:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
35:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 27; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 50; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
36:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
37:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 84; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
38:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
39:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
40:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 40; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
41:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 75; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
42:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
43:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 94; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 43; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
44:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
45:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
46:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 3; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 51; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
47:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
48:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 48; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
49:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 48; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
50:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 33; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 50; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 27; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
51:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 3; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 51; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
52:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 43; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
53:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
54:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 54; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
55:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
56:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 88; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
57:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 94; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 43; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
58:
    IF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
59:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
60:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 96; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 50; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
61:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
62:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 92; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 71; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
63:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 29; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
64:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
65:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 92; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
66:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 80; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
67:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 57; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 43; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
68:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
69:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 69; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 44; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 45; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
70:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 90; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 53; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 22; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
71:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 71; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 92; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
72:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 15; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 52; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 72; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 67; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
73:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 35; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 60; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
74:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 74; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 18; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
75:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 75; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 89; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
76:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 40; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 41; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
77:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 31; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 89; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 76; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 75; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
78:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
79:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 19; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 81; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 79; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
80:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 63; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 66; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 80; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 5; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
81:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 64; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 81; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 79; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
82:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 46; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 28; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 82; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 25; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 8; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
83:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 83; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 77; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 58; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 59; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 13; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    END_IF;
84:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 37; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 38; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 11; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 42; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 84; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 12; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 55; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 4; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
85:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 62; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 14; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 24; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 70; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 85; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 9; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 92; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 65; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    END_IF;
86:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 32; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 61; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 79; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 26; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 7; y0 := FALSE; y1 := TRUE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 10; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 49; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 34; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 86; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 23; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 93; y0 := FALSE; y1 := TRUE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 56; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 1; y0 := FALSE; y1 := FALSE; t0_start := TRUE; t0_up := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 21; y0 := TRUE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
87:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 39; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 98; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 17; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 73; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 68; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 47; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 78; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 99; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 20; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 95; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 30; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 2; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 6; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 87; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (t0.Q = FALSE)) THEN 
        cstate90 := 36; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (t0.Q = TRUE)) THEN 
        cstate90 := 16; y0 := FALSE; y1 := FALSE; t0_start := FALSE; 
    END_IF;
END_CASE;

(* Additional processing to handle clocks - in CODESYS, it only starts
    with rising edge and can not be placed inside IF statement *) 
IF(t0_up = TRUE) THEN
    t0_reset := TRUE;
ELSIF(t0_start = TRUE AND t0_up = FALSE) THEN
    t0_up := TRUE;  t0_reset := FALSE;
END_IF;

END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
