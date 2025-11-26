%%

%class Yylex
%unicode
%cup
%line
%column
%eofval{
    // Retorna o token de EOF direto pelo código 0 (padrão do CUP)
    return new java_cup.runtime.Symbol(0);
%eofval}

DIGIT = [0-9]
NUMBER = {DIGIT}+

%%

"rgb"                 { return new java_cup.runtime.Symbol(parser.Sym.RGB); }

"#"[0-9a-fA-F]{6}     { return new java_cup.runtime.Symbol(parser.Sym.HEX, yytext()); }
"#"[0-9a-fA-F]{3}     { return new java_cup.runtime.Symbol(parser.Sym.HEX, yytext()); }

"("                   { return new java_cup.runtime.Symbol(parser.Sym.LPAREN); }
")"                   { return new java_cup.runtime.Symbol(parser.Sym.RPAREN); }
","                   { return new java_cup.runtime.Symbol(parser.Sym.COMMA); }
";"                   { return new java_cup.runtime.Symbol(parser.Sym.SEMI); }
{NUMBER}              { return new java_cup.runtime.Symbol(parser.Sym.NUM, Integer.valueOf(yytext())); }

\s+                   { /* ignorar espaços */ }

.                     {
                        System.err.println("ERRO: caractere inválido: " + yytext());
                        return new java_cup.runtime.Symbol(parser.Sym.ERROR);
                      }
