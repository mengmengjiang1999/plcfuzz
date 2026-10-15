
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      c1_geq10	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      c1_reset	: BOOL;
      c1_add1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 14 *)
      cstate70	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate70 OF
11:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 3; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 11; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
12:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 12; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 13; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
13:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 13; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 12; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    END_IF;
0:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 13; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 12; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
1:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
2:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 11; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 3; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
3:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 11; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 3; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
4:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
5:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 6; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 8; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
6:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 6; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 8; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
7:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
8:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 4; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 8; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 6; y0 := FALSE; c1_reset := FALSE; c1_add1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 7; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    END_IF;
9:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 5; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 2; y0 := FALSE; c1_reset := TRUE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 9; y0 := TRUE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE )) THEN 
        cstate70 := 1; y0 := TRUE; c1_reset := FALSE; c1_add1 := TRUE;  
    END_IF;
10:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  ( TRUE )) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (c1_geq10 = FALSE)) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (c1_geq10 = FALSE)) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (c1_geq10 = TRUE)) THEN 
        cstate70 := 10; y0 := FALSE; c1_reset := FALSE; c1_add1 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


