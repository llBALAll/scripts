@ECHO OFF

set MASK=192.168.0.
set HOST1=100
set HOST2=110
set /A FLAGFIND=1

set /A HOST=%HOST1%
:looplog
	ping -n 1 -w 250 %MASK%%HOST% | findstr /c:"Reply"
	IF [%ERRORLEVEL%]==[0] (
		set /A FLAGFIND=0
		rem ECHO Reply from %MASK%%HOST%
	) ELSE (
		ECHO host %MASK%%HOST% unreachable
	)
	set /A HOST=HOST+1
	
	IF [%HOST%] GTR [%HOST2%] (
		EXIT /b %FLAGFIND%
	)
goto looplog