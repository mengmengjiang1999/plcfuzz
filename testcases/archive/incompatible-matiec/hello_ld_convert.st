PROGRAM HelloWorld
  VAR
    // 变量声明
    Rosc : BOOL;
    Tosc : TON;
    cnt : INT := 0;
    HelloString : STRING(21) := 'Hello, world: %5r\n';
  END_VAR

  // 注释：Very simple, just print 'Hello, world' over serial, over and over.
  
  // RUNG 1: 振荡器逻辑
  Tosc(IN := NOT Rosc, PT := T#1000ms);
  Rosc := Tosc.Q;
  
  // RUNG 2: 注释：For no particular reason, keep a counter that increments with each line that we print.
  
  // RUNG 3: 计数器递增
  IF Rosc THEN
    cnt := cnt + 1;
  END_IF;
  
  // RUNG 4: 格式化字符串输出
  IF Rosc THEN
    // 使用格式化字符串输出
    // 原始LDmicro格式: FORMATTED_STRING cnt 21 72 101 108 108 111 44 32 119 111 114 108 100 58 32 92 45 53 92 114 92 110
    // 转换为: 'Hello, world: %5r\n'
    // 在IEC中通常通过串口函数实现
    SerialPrint(HelloString, cnt);
  END_IF;
END_PROGRAM

// 定时器功能块定义
FUNCTION_BLOCK TON
  VAR_INPUT
    IN : BOOL;
    PT : TIME;
  END_VAR
  VAR_OUTPUT
    Q : BOOL;
    ET : TIME;
  END_VAR
  VAR
    StartTime : TIME;
  END_VAR
  
  IF IN AND NOT Q THEN
    StartTime := CURRENT_TIME;
    Q := FALSE;
  ELSIF IN THEN
    ET := CURRENT_TIME - StartTime;
    Q := (ET >= PT);
  ELSE
    Q := FALSE;
    ET := T#0s;
  END_IF;
END_FUNCTION_BLOCK

// 串口输出函数（需要根据具体硬件实现）
FUNCTION SerialPrint : BOOL
  VAR_INPUT
    FormatString : STRING;
    Value : INT;
  END_VAR
  VAR
    // 串口实现相关变量
  END_VAR
  
  // 这里应该是具体的串口输出实现
  // 例如：将格式化字符串和值发送到串口
  SerialPrint := TRUE;
END_FUNCTION

CONFIGURATION HelloConfig
  VAR_GLOBAL
    // 硬件相关全局变量
  END_VAR
  
  RESOURCE Mega8_Resource ON ATmega8
    TASK MainTask(INTERVAL := T#10ms, PRIORITY := 1);
    PROGRAM HelloWorldInstance WITH MainTask : HelloWorld;
    
    // 串口配置
    SerialConfig(BAUD := 9600, CRYSTAL := 16000000);
  END_RESOURCE
END_CONFIGURATION
