
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
   (* The total number of states equals to 28 *)
      cstate52	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate52 OF
22:
    IF (( TRUE )) THEN 
        cstate52 := 22; grant := FALSE;  
    END_IF;
23:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 24; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 5; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    END_IF;
24:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    END_IF;
25:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 9; grant := FALSE;  
    END_IF;
26:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
27:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 26; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 22; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 15; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 20; grant := FALSE;  
    END_IF;
10:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 11; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 17; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 22; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 20; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 16; grant := FALSE;  
    END_IF;
11:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    END_IF;
12:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 13; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 19; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
13:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
14:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 19; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 13; grant := FALSE;  
    END_IF;
15:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    END_IF;
16:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = FALSE)) THEN 
        cstate52 := 10; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = FALSE)) THEN 
        cstate52 := 3; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = FALSE)) THEN 
        cstate52 := 27; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = FALSE)) THEN 
        cstate52 := 21; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 12; grant := FALSE;  
    END_IF;
17:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
18:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 9; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    END_IF;
19:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    END_IF;
0:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 25; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 4; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 20; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 16; grant := FALSE;  
    END_IF;
1:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 12; grant := FALSE;  
    END_IF;
2:
    IF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 3; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 21; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 9; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 6; grant := FALSE;  
    END_IF;
3:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 4; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 20; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 16; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 22; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 25; grant := FALSE;  
    END_IF;
4:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 12; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
5:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 18; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 8; grant := TRUE;  
    END_IF;
6:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = FALSE)) THEN 
        cstate52 := 3; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = FALSE)) THEN 
        cstate52 := 10; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = FALSE)) THEN 
        cstate52 := 21; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = FALSE)) THEN 
        cstate52 := 27; grant := FALSE;  
    END_IF;
7:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 24; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 5; grant := FALSE;  
    END_IF;
8:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 12; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
9:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 9; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate52 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 6; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate52 := 2; grant := FALSE;  
    END_IF;
20:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 21; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 9; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 3; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 6; grant := FALSE;  
    END_IF;
21:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 14; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate52 := 22; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 20; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate52 := 23; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate52 := 16; grant := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


