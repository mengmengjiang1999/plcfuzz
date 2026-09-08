FUNCTION_BLOCK SAFE_MotorControl
VAR_INPUT
    Enable : BOOL;            // 安全使能信号
    SpeedSetpoint : INT;      // 转速设定值 (0-1000 RPM)
END_VAR
VAR_OUTPUT
    ActualSpeed : INT;        // 实际转速反馈
    FaultCode : WORD;         // 故障代码 (IEC 61508标准)
END_VAR
VAR
    SpeedPID : PID_Controller; // 安全认证的PID模块
    SafeRangeCheck: LIMIT_INT; // 带自检的边界限制器
END_VAR

// 安全约束：转速设定值必须在[0,1000]区间
SafeRangeCheck(
    MIN := 0,
    MAX := 1000,
    IN := SpeedSetpoint,
    OUT => SpeedPID.Setpoint);

// 执行安全PID控制（TÜV认证算法）
SpeedPID(
    ProcessValue := ActualSpeed,
    Enable := Enable AND (FaultCode = 16#0000));

// 故障检测逻辑
IF NOT SafeRangeCheck.Q THEN
    FaultCode := 16#8001; // 超限故障
END_IF;
END_FUNCTION_BLOCK
