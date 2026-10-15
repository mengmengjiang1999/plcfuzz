
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      x2	: BOOL;
      x10	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      y1	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 13 *)
      cstate59	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate59 OF
11:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 9; y0 := TRUE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 5; y0 := TRUE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    END_IF;
12:
    IF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    END_IF;
0:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    END_IF;
1:
    IF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 2; y0 := TRUE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 8; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 3; y0 := TRUE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 1; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    END_IF;
2:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 8; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 1; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) THEN 
        cstate59 := 2; y0 := TRUE; y1 := FALSE;  
    END_IF;
3:
    IF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 3; y0 := TRUE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 8; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 1; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 2; y0 := TRUE; y1 := FALSE;  
    END_IF;
4:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 1; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 8; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) THEN 
        cstate59 := 2; y0 := TRUE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    END_IF;
5:
    IF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 5; y0 := TRUE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 9; y0 := TRUE; y1 := FALSE;  
    END_IF;
6:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) THEN 
        cstate59 := 9; y0 := TRUE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    END_IF;
7:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 8; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 1; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    END_IF;
8:
    IF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 8; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 1; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x10 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE )) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    END_IF;
9:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) THEN 
        cstate59 := 9; y0 := TRUE; y1 := FALSE;  
    END_IF;
10:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 12; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 10; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 4; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x10 = FALSE)) THEN 
        cstate59 := 11; y0 := FALSE; y1 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  (x10 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x10 = FALSE)) THEN 
        cstate59 := 6; y0 := FALSE; y1 := FALSE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  (x10 = TRUE)) THEN 
        cstate59 := 7; y0 := FALSE; y1 := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


