import java_cup.runtime.*;

%%

%cup
%class Lexer
%line
%column

DIGIT = [0-9]
NUMBER = {DIGIT}+
LETRA = [a-fA-F]
HEX_DIGIT = ({LETRA} | {DIGIT})
HEX = {HEX_DIGIT}{6}

%%

"#" {return new Symbol(sym.JV, yyline, yycolumn);}
"rgb" {return new Symbol(sym.RGB, yyline, yycolumn);}
"(" {return new Symbol(sym.LPAREN, yyline, yycolumn);}
"," {return new Symbol(sym.VIR, yyline, yycolumn);}
")" {return new Symbol(sym.RPAREN, yyline, yycolumn);}
";" {return new Symbol(sym.PVIR, yyline, yycolumn);}
{NUMBER} {return new Symbol(sym.NUM, yyline, yycolumn, Integer.parseInt(yytext()));}
{HEX} {return new Symbol(sym.HEX, yyline, yycolumn, yytext().toString());}

\s+ {/*IGNORAR */}