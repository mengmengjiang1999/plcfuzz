
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
   (* The total number of states equals to 42 *)
      cstate34	: LINT := 0;
   END_VAR

   (* Control logic *)
CASE cstate34 OF
22:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 7; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 19; grant := FALSE;  
    END_IF;
23:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 24; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 8; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 41; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 11; grant := TRUE;  
    END_IF;
24:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 22; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 17; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 31; grant := FALSE;  
    END_IF;
25:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    END_IF;
26:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 40; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 25; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    END_IF;
27:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 25; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 40; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 33; grant := FALSE;  
    END_IF;
28:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 19; grant := FALSE;  
    END_IF;
29:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 17; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 22; grant := FALSE;  
    END_IF;
30:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 6; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 11; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 5; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 24; grant := TRUE;  
    END_IF;
31:
    IF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 34; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 3; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 37; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 27; grant := FALSE;  
    END_IF;
10:
    IF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 38; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 16; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 24; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 11; grant := TRUE;  
    END_IF;
32:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 22; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 17; grant := FALSE;  
    END_IF;
11:
    IF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 10; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 19; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 23; grant := FALSE;  
    END_IF;
33:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 5; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 6; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 24; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 11; grant := TRUE;  
    END_IF;
12:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 13; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 35; grant := FALSE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 39; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 21; grant := FALSE;  
    END_IF;
34:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 30; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 20; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 36; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 4; grant := FALSE;  
    END_IF;
13:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 12; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 17; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 31; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 22; grant := FALSE;  
    END_IF;
35:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 19; grant := FALSE;  
    END_IF;
14:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 1; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 33; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 40; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 25; grant := FALSE;  
    END_IF;
36:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    END_IF;
15:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 22; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 17; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 31; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 12; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 32; grant := FALSE;  
    END_IF;
37:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 25; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 40; grant := FALSE;  
    END_IF;
16:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    END_IF;
38:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    END_IF;
17:
    IF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 12; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 17; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 31; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 22; grant := FALSE;  
    END_IF;
39:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 19; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 23; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 10; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 7; grant := FALSE;  
    END_IF;
18:
    IF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 10; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 19; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 23; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 7; grant := FALSE;  
    END_IF;
19:
    IF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 20; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 30; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 36; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 4; grant := FALSE;  
    END_IF;
0:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 35; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 13; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 39; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 21; grant := FALSE;  
    END_IF;
1:
    IF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 5; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 24; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 11; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 6; grant := TRUE;  
    END_IF;
2:
    IF (( TRUE )) THEN 
        cstate34 := 2; grant := FALSE;  
    END_IF;
3:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 4; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 36; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    END_IF;
4:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    END_IF;
5:
    IF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 17; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 22; grant := FALSE;  
    END_IF;
6:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 7; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 19; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 14; grant := FALSE;  
    END_IF;
7:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 4; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 36; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    END_IF;
8:
    IF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    END_IF;
9:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 7; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 26; grant := FALSE;  
    ELSIF ((req = TRUE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 10; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 14; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 19; grant := FALSE;  
    ELSIF ((req = FALSE) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 23; grant := FALSE;  
    END_IF;
40:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    END_IF;
41:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 29; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 28; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 9; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 15; grant := TRUE;  
    END_IF;
20:
    IF ((req = FALSE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 5; grant := TRUE;  
    ELSIF (( TRUE ) AND  ( TRUE ) AND  (go = FALSE)) THEN 
        cstate34 := 2; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = FALSE) AND  (go = TRUE)) THEN 
        cstate34 := 6; grant := TRUE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 24; grant := TRUE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  (go = TRUE)) THEN 
        cstate34 := 11; grant := TRUE;  
    END_IF;
21:
    IF ((req = TRUE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 22; grant := FALSE;  
    ELSIF ((req = TRUE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 18; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = FALSE) AND  ( TRUE )) THEN 
        cstate34 := 32; grant := FALSE;  
    ELSIF ((req = FALSE) AND  (cancel = TRUE) AND  ( TRUE )) THEN 
        cstate34 := 17; grant := FALSE;  
    END_IF;
END_CASE;

END_FUNCTION_BLOCK


