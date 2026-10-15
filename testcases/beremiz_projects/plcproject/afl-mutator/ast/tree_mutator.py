# tree_mutator.py
from antlr4 import *
from STLexer import STLexer
from STParser import STParser

class TreeMutator(ParseTreeVisitor):
    def visitIfStatement(self, ctx):
        # 变异条件表达式
        if random.random() < 0.5:
            new_cond = self._mutate_expr(ctx.expr())
            ctx.children[1] = new_cond
        
        # 递归处理子节点
        self.visitChildren(ctx)

def mutate_via_tree(data):
    input_stream = InputStream(data.decode())
    lexer = STLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = STParser(stream)
    tree = parser.statement()
    
    mutator = TreeMutator()
    mutator.visit(tree)
    return str(tree).encode()