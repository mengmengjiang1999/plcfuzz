
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x1	: BOOL;
      x2	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
      y1	: BOOL;
      y2	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 6 *)
      cstate79	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate79 OF
0:
    IF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
        cstate79 := 1; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x1 = FALSE) AND  (x2 = FALSE)) THEN 
        cstate79 := 2; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
        cstate79 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
1:
    IF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
        cstate79 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
        cstate79 := 1; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
2:
    IF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
        cstate79 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
        cstate79 := 1; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x1 = FALSE) AND  (x2 = FALSE)) THEN 
        cstate79 := 2; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
3:
    IF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
        cstate79 := 4; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    ELSIF (( TRUE ) AND  (x2 = FALSE)) THEN 
        cstate79 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    END_IF;
4:
    IF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
        cstate79 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x1 = FALSE) AND  ( TRUE )) THEN 
        cstate79 := 4; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
5:
    IF ((x1 = FALSE) AND  (x2 = FALSE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x1 = TRUE) AND  (x2 = TRUE)) THEN 
        cstate79 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
    ELSIF ((x1 = TRUE) AND  (x2 = FALSE)) THEN 
        cstate79 := 3; y0 := TRUE; y1 := TRUE; y2 := FALSE;  
    ELSIF ((x1 = FALSE) AND  (x2 = TRUE)) THEN 
        cstate79 := 4; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


