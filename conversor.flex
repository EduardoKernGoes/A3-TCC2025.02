%%

%class Yylex
%unicode
%cup
%line
%column
%implements java_cup.runtime.Scanner 

DIGIT = [0-9]
NUMBER = {DIGIT}+

%%

"rgb"       { return sym.RGB; }
"("         { return sym.LPAREN; }
")"         { return sym.RPAREN; }
","         { return sym.COMMA; }
";"         { return sym.SEMI; }
{NUMBER}    { return new java_cup.runtime.Symbol(sym.NUM, Integer.valueOf(yytext())); }

\s+         { /* ignorar */ }
.           { System.out.println("ERRO: caractere inválido: " + yytext()); }