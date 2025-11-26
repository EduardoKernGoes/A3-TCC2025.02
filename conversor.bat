@echo off
setlocal

set JARCUP_RUNTIME=java-cup-11b-runtime.jar
set JAFLEX_TOOL=jflex.jar
set JARCUP_TOOL=java-cup-11b.jar
set ARQUIVO_ENTRADA=conversor.txt

rem === Criar pasta parser se não existir ===
if not exist parser (
    mkdir parser
)

rem === Remover arquivos antigos ===
if exist Yylex.java del /Q Yylex.java
if exist parser\Parser.java del /Q parser\Parser.java
if exist parser\Sym.java del /Q parser\Sym.java

rem === Gerar Yylex ===
java -jar %JAFLEX_TOOL% conversor.flex
if errorlevel 1 goto erro_jflex

rem === Gerar Parser/Sym ===
java -jar %JARCUP_TOOL% -destdir parser -parser Parser -symbols Sym conversor.cup
if errorlevel 1 goto erro_jcup

rem === Compilar ===
javac -cp .;%JARCUP_RUNTIME% Main.java Yylex.java parser\Parser.java parser\Sym.java
if errorlevel 1 goto erro_compilacao

rem === Executar ===
java -cp .;%JARCUP_RUNTIME% Main %ARQUIVO_ENTRADA%

goto fim

:erro_jflex
echo ERRO NO JFLEX
goto fim

:erro_jcup
echo ERRO NO JCUP
goto fim

:erro_compilacao
echo ERRO NA COMPILACAO
goto fim

:fim
pause
endlocal
