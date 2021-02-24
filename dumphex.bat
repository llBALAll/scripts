@ECHO OFF

rem dump file in hexadecimal/ascii format
rem usage: dumphex FILE

IF "%1"=="" (
	ECHO File not found!
	ECHO Usage: dumphex FILE
	EXIT /B 1
)

certutil.exe -encodehex %1 "hexdump.temp" >NUL
type hexdump.temp
del /f hexdump.temp