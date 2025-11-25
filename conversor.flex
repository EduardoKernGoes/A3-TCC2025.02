

%%

%standalone
%class Lexer
%unicode
%line
%column

DIGIT = [0-9]
NUMBER = {DIGIT}+

%%

"rgb" {System.out.println("Simbulo RGB");}
"(" {System.out.println("Simbulo (");}
"," {System.out.println("Simbulo ,");}
")" {System.out.println("Simbulo )");}
";" {System.out.println("Simbulo ;");}
{NUMBER} {System.out.println("Num: " + yytext());}

\s+ {/*IGNORAR */}