TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

PROGRAM program0
    VAR_INPUT
    PB1 : BOOL;
    END_VAR
    VAR
        current_state : INT := 0;  (* 0=IDLE, 1=RUNNING, 2=ERROR *)
    END_VAR

    CASE current_state OF
        0: (* IDLE *)
            current_state := 1;
        
        1: (* RUNNING *)
                current_state := 2;
        2: (* ERROR *)
            current_state := 0;
    END_CASE;
END_PROGRAM

CONFIGURATION Config0
  VAR_GLOBAL
    PB1 AT %IX0.0 : BOOL;
  END_VAR

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
