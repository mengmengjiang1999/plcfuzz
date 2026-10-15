
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      x0	: BOOL;
      x1	: BOOL;
      x2	: BOOL;
      x3	: BOOL;
   END_VAR
   VAR_OUTPUT
      y0	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 12 *)
      cstate33	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate33 OF
22:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 247; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 246; y0 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    END_IF;
0:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 0; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 24; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 27; y0 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 18; y0 := FALSE;  
    END_IF;
243:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 24; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 243; y0 := TRUE;  
    END_IF;
24:
    IF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 243; y0 := TRUE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 24; y0 := FALSE;  
    END_IF;
246:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 246; y0 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 786; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 247; y0 := FALSE;  
    END_IF;
27:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 24; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 27; y0 := TRUE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF (( TRUE ) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR (( TRUE ) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 18; y0 := FALSE;  
    END_IF;
247:
    IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 786; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 247; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 246; y0 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    END_IF;
786:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 247; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 786; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 246; y0 := TRUE;  
    ELSIF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    END_IF;
28:
    IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 24; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 243; y0 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    END_IF;
29:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 247; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 246; y0 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  ( TRUE )) THEN 
        cstate33 := 22; y0 := FALSE;  
    END_IF;
18:
    IF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 27; y0 := TRUE;  
    ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE )) OR ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 18; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    END_IF;
20:
    IF ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  (x3 = TRUE)) THEN 
        cstate33 := 29; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x3 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE)) THEN 
        cstate33 := 22; y0 := FALSE;  
    ELSIF ((x0 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x3 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE)) THEN 
        cstate33 := 20; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 28; y0 := FALSE;  
    ELSIF ((x0 = TRUE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE)) THEN 
        cstate33 := 243; y0 := TRUE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


