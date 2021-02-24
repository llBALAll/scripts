@ECHO OFF

rem print a dump of a array passed by pipe
rem usage: echo MZ HEADER.. | hexdump_pipe

for /f "tokens=*" %%$ in ('more') do (
	echo %%$ > file.temp
	certutil.exe -encodehex file.temp "hexdump.temp" >NUL
	type hexdump.temp
	del /f file.temp
	del /f hexdump.temp
)
