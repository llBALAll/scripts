@ECHO OFF
rem I CODED THIS SCRIPT TO MONITORATE A LOG FILE THAT AN OTHER APLICATION IS GENERATING;
rem ONLY YOU NEED TO DO IS CHANGE THE FILEPATHNAME


SET FILEPATHNAME=logger.txt


set INTERVAL=1

:looplog

	if exist logger.txt (
		PowerShell Get-content %FILEPATHNAME% -Wait 2> nul
		if %errorlevel% equ 0 (
			cls
			ECHO THE FILE WAS DELETED
		)
	) 

	timeout %INTERVAL% > nul

goto looplog