@ECHO OFF
rem JUST FOR CREATE A LOOP THAT WRITES A COUNT VARIABLE IN A FILE


set INTERVAL=2
set /A CONTA=0


:looplog

	set /A CONTA=CONTA+1
	ECHO %CONTA
	ECHO %CONTA% >> logger.txt
	timeout %INTERVAL% >nul

goto looplog
