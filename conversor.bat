@echo off
setlocal

set CLASSE_MAIN= parser
set ARQUIVO_ENTRADA= *.txt

CALL jflex *.flex

CALL java java_cup.Main *.cup

CALL javac *.java

CALL java %CLASSE_MAIN% %ARQUIVO_ENTRADA%

goto :fim

:fim
pause
endlocal