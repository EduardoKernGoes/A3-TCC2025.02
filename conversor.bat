@echo off
setlocal

set JARCUP_RUNTIME=java-cup-11b-runtime.jar
set JAFLEX_TOOL=jflex.jar 
set JARCUP_TOOL=java-cup-11b.jar
set ARQUIVO_ENTRADA=conversor.txt

: JFlex gera Yylex.java
java -jar %JAFLEX_TOOL% conversor.flex
if errorlevel 1 goto erro_jflex

: JCup gera Parser.java e Sym.java
java -jar %JARCUP_TOOL% -parser Parser -symbols Sym conversor.cup
if errorlevel 1 goto erro_jcup

: Compila Main, Yylex, e as classes no pacote parser
javac -cp %JARCUP_RUNTIME% Main.java Yylex.java parser\Parser.java parser\Sym.java
if errorlevel 1 goto erro_compilacao

java -cp .;%JARCUP_RUNTIME% Main %ARQUIVO_ENTRADA% 

goto fim

:erro_jflex
goto fim

:erro_jcup
goto fim

:erro_compilacao
goto fim

:fim
pause
endlocal