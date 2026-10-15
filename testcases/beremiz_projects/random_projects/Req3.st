
FUNCTION_BLOCK FB_G4LTL

   (* Variable definition *)
   VAR_INPUT
      req	: BOOL;
      cancel	: BOOL;
      go	: BOOL;
   END_VAR
   VAR_OUTPUT
      grant	: BOOL;
   END_VAR
   VAR
   (* The total number of states equals to 22 *)
      cstate23	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate23 OF
11:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 8; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 15; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 11; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 19; grant := FALSE;  
    END_IF;
12:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 13; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 6; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 10; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 20; grant := FALSE;  
    END_IF;
13:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 7; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 4; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 18; grant := TRUE;  
    END_IF;
14:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 4; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 18; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 7; grant := TRUE;  
    END_IF;
15:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 9; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 21; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 17; grant := FALSE;  
    END_IF;
16:
    IF (( TRUE )) THEN 
        cstate23 := 16; grant := FALSE;  
    END_IF;
17:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 3; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 14; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 5; grant := FALSE;  
    END_IF;
18:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 11; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 19; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 8; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 15; grant := FALSE;  
    END_IF;
19:
    IF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 19; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 15; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 11; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 8; grant := FALSE;  
    END_IF;
0:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 11; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 19; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 15; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 8; grant := FALSE;  
    END_IF;
1:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 18; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 7; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 4; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    END_IF;
2:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 17; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 9; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 21; grant := FALSE;  
    END_IF;
3:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 4; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 7; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 18; grant := TRUE;  
    END_IF;
4:
    IF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 9; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 21; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 17; grant := FALSE;  
    END_IF;
5:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 18; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 4; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 7; grant := TRUE;  
    END_IF;
6:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 7; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 4; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 18; grant := TRUE;  
    END_IF;
7:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 8; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 15; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 11; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 19; grant := FALSE;  
    END_IF;
8:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 9; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 17; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 21; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    END_IF;
9:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 10; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 20; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 13; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 6; grant := FALSE;  
    END_IF;
20:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 18; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 7; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 4; grant := TRUE;  
    END_IF;
10:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 7; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate23 := 2; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate23 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 18; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate23 := 4; grant := TRUE;  
    END_IF;
21:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 14; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 5; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate23 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate23 := 3; grant := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


