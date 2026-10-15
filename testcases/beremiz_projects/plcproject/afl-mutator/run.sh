# 使用自定义语法变异器
afl-fuzz -i seeds/ -o findings/ \
  -x st_grammar.json \
  -E ./grammar_mutator.py \
  -- ./plc_runner @@


afl-fuzz -i corpus/ -o findings/ \
  -P ./tree_mutator.py \
  -- ./plc_simulator @@