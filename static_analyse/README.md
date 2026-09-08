# PLC 变量映射提取

`main.py` 从生成的 `src/glueVars.cpp` 提取 I/O 与内存变量绑定，默认把唯一的活动映射写到仓库根目录：

```sh
python3 static_analyse/main.py
```

可显式指定输入和输出，适合校验或临时比较：

```sh
python3 static_analyse/main.py \
  --input src/glueVars.cpp \
  --output /tmp/plc_variables_mapping.csv
```

不要在 `static_analyse/` 内保存第二份映射；自定义变异器默认读取根目录的 `plc_variables_mapping.csv`。
