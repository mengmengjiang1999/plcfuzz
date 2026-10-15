
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      x2	: BOOL;
      x3	: BOOL;
      x4	: BOOL;
      x5	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      y1	: BOOL;
      y2	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 84 *)
      cstate49	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate49 OF
44:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 79; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
45:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
46:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
47:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 47; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
48:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 48; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
49:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 49; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
50:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 50; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
51:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
52:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
53:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
10:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 10; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
54:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 19; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
11:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
55:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
12:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
56:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
13:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
57:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 25; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
14:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
58:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
15:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
59:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 19; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
16:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 16; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
17:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 17; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
18:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 48; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
19:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 19; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
0:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 1; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 73; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 35; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 71; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 80; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
1:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 1; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
2:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
3:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
4:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
5:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 10; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
6:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 49; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
7:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 50; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
8:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
9:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
60:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 60; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
61:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 76; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
62:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
63:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 47; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
64:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 41; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
20:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
21:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
65:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
22:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
66:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
23:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
67:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
24:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 48; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
68:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
25:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 25; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
69:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
26:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
27:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
28:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
29:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 74; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
70:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 70; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
71:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 71; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 16; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
72:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 70; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
73:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 1; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 73; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
30:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
74:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 74; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
31:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
75:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
76:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 76; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
32:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 39; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
33:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 60; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
77:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
34:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 10; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
78:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
35:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 35; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 82; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
79:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 79; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
36:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
37:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
38:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
39:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 39; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
80:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 81; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 80; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
81:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 81; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
82:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 82; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    END_IF;
83:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
40:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
41:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 41; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
42:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
        cstate49 := 17; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    END_IF;
43:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
        cstate49 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
        cstate49 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
        cstate49 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
        cstate49 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
        cstate49 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
        cstate49 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


