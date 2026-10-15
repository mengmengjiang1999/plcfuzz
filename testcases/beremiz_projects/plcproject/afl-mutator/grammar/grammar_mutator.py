# grammar_mutator.py
import json, random

class GrammarMutator:
    def __init__(self, grammar_file):
        with open(grammar_file) as f:
            self.grammar = json.load(f)
    
    def mutate(self, data):
        # 解析当前输入的语法结构
        parsed = self._parse(data.decode())
        
        # 选择变异点（示例：随机替换语句类型）
        if random.random() < 0.7 and "<if_statement>" in parsed:
            new_stmt = random.choice(self.grammar["<if_statement>"])
            return data.replace(b"IF", new_stmt.encode())
        
        # 默认变异保留原始行为
        return afl_mutate(data)

# AFL++接口函数
def init(seed):
    return GrammarMutator("st_grammar.json")