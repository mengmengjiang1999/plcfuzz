// ST.g4
grammar ST;

statement: assignment | ifStatement;
assignment: ID ':=' expr ';';
ifStatement: 'IF' expr 'THEN' statement ('ELSE' statement)? 'END_IF';
expr: ID | INT | expr ('>'|'<'|'=') expr;