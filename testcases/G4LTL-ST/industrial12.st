PROGRAM program0
  VAR
    x0 AT %IX0.0 : BOOL;
    x1 AT %IX0.1 : BOOL;
    x2 AT %IX0.2 : BOOL;
    x3 AT %IX0.3 : BOOL;
    x4 AT %IX0.4 : BOOL;
    x5 AT %IX0.5 : BOOL;
    y0 AT %QX0.0 : BOOL;
    y1 AT %QX0.1 : BOOL;
    y2 AT %QX0.2 : BOOL;
  END_VAR
  VAR
    cstate63 : DINT := 0;
  END_VAR


  CASE cstate63 OF
  44:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 79; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  45:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  46:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  47:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 47; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  48:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 48; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  49:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 49; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  50:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 50; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  51:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  52:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  53:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  10:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 10; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  54:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 19; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  11:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  55:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  12:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  56:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  13:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  57:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 25; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  14:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  58:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  15:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  59:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 19; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  16:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 16; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  17:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 17; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  18:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 48; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  19:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 19; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  0:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 1; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 73; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 35; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 71; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 80; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  1:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 1; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  2:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  3:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  4:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  5:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 10; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  6:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 49; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  7:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 50; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  8:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  9:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  60:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 60; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  61:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 76; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  62:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  63:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 47; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  64:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 41; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  20:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  21:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  65:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  22:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  66:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  23:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  67:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  24:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 48; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  68:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  25:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 4; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 25; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  69:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 69; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  26:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 26; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 62; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  27:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  28:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 46; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  29:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 74; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  70:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 70; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  71:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 71; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 16; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 22; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  72:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 70; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 51; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  73:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 1; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 73; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 6; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  30:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  74:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 74; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  31:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  ( TRUE )) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  75:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 58; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 75; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  76:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 61; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 7; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 21; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 76; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 53; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  32:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 39; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  33:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 60; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  77:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  34:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 5; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 10; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  ( TRUE )) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 11; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 68; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  78:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 78; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 29; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      END_IF;
  35:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 35; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 82; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  79:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  ( TRUE ) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 79; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  36:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 14; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 36; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 20; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  37:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 15; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 37; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 27; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  38:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 30; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 33; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  39:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 52; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 39; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 57; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  80:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 81; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 80; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  81:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 38; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 31; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 81; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 28; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 72; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 34; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 32; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  82:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 45; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 63; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 82; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      END_IF;
  83:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 83; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 65; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 44; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  40:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 77; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 3; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 54; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 56; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 66; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  41:
      IF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 41; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 40; y0 := FALSE; y1 := FALSE; y2 := TRUE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 23; y0 := FALSE; y1 := TRUE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  42:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 59; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 55; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 67; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 42; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) THEN 
          cstate63 := 17; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 64; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  43:
      IF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = TRUE)) THEN 
          cstate63 := 12; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = FALSE) AND  (x5 = FALSE)) OR ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 43; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = FALSE)) THEN 
          cstate63 := 13; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 24; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = TRUE)) THEN 
          cstate63 := 2; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  (x4 = TRUE) AND  (x5 = FALSE)) THEN 
          cstate63 := 8; y0 := TRUE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = FALSE) AND  ( TRUE ) AND  (x5 = TRUE)) THEN 
          cstate63 := 18; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      ELSIF ((x0 = FALSE) AND  (x1 = FALSE) AND  (x2 = TRUE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = FALSE) AND  (x1 = TRUE) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = FALSE) AND  (x3 = TRUE) AND  ( TRUE ) AND  ( TRUE )) OR ((x0 = TRUE) AND  ( TRUE ) AND  (x2 = TRUE) AND  ( TRUE ) AND  ( TRUE ) AND  ( TRUE )) THEN 
          cstate63 := 9; y0 := FALSE; y1 := FALSE; y2 := FALSE;  
      END_IF;
  END_CASE;


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
