PROGRAM PLC_TimerCounter
VAR
    Rnew : BOOL := FALSE;
    
    Tnew : TON; 
    
    Css   : CTU := (PV := 59);
    Cmm   : CTU := (PV := 59);
    Chh   : CTU;              
    Cdays : CTU := (PV := 364); 
    
    TimerPreset : TIME := T#1S;
END_VAR

PROGRAM program0
    IF NOT Rnew THEN
        Tnew(IN := TRUE, PT := TimerPreset);
        IF Tnew.Q THEN
            Rnew := TRUE;
            Tnew(IN := FALSE);
        END_IF
    END_IF

    IF NOT Rnew THEN
        // 秒计数器
        Css(CU := TRUE, R := FALSE);
        IF Css.Q THEN
            Css(R := TRUE);
            
            // 分计数器
            Cmm(CU := TRUE, R := FALSE);
            IF Cmm.Q THEN
                Cmm(R := TRUE);
                
                Chh(CU := TRUE, R := FALSE);
                IF Chh.Q THEN
                    Chh(R := TRUE); 
                    
                    Cdays(CU := TRUE, R := FALSE);
                    IF Cdays.Q THEN
                        Cdays(R := TRUE); 
                    END_IF
                END_IF
            END_IF
        END_IF
    END_IF
    
    IF Rnew AND NOT Tnew.Q THEN
        Rnew := FALSE;
    END_IF
END_PROGRAM


CONFIGURATION Config0
  VAR_GLOBAL
  END_VAR
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION