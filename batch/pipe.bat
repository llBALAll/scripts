@echo OFF

REM Este script serve pra redirecionar a saida de um comando para a entrada de outro comando que nao aceita pipe;
REM ex: dir /B *.txt | pipe type
REM ex: type file_list.txt | pipe del
REM type hosts_list.txt | pipe ping -n 1 | findstr /i Reply

set argCount=0

for %%x in (%*) do (
    set /A argCount+=1
)

if "%argCount%"=="0" (
    echo.
    echo [pipe]
    echo.
    echo "Redirects the output from one command to another that does not accept pipe (|) by default"
    echo.
    echo "Usage: <COMMAND_1 ARGS> | %0 <COMMAND_2 ARGS>"
    echo "   ex: type file_list.txt | pipe del"
    exit /B 1
)

for /f "tokens=*" %%x in ('more') do (
    cmd /C %* "%%~x"
)