@ECHO OFF

rem print&save a hexdump of a file
rem ECHO Usage: hexdump2file INFILE OUTFILE

IF "%1" neq "" (  
	IF "%2" neq "" (
		certutil.exe -encodehex %1 %2 >NUL
		type %2
		EXIT /B 0
	)
)

ECHO File not found!
ECHO.
ECHO  Usage: hexdump2file INFILE OUTFILE
EXIT /B 1
