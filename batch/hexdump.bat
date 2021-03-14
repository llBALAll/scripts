@ECHO OFF

rem print a hexdump of a file
rem usage: hexdump FILE

IF "%1"=="" (
	ECHO File not found!
	ECHO Usage: hexdump FILE
	EXIT /B 1
)

certutil.exe -encodehex %1 "hexdump.temp" >NUL
type hexdump.temp
del /f hexdump.temp