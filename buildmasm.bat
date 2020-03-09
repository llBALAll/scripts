@ECHO OFF
rem PLACE THIS SCRIPT IN YOUR PROJECT DIRECTORY
rem MODIFY FILENAME, VISUAL STUDIO MASM AND WINDOWS SDK LIBS PATHS
rem AFTER MODIFY, TO BUILD JUST DOUBLE CLICK IT

ECHO.
ECHO =========================================================
ECHO =                      MASM BUID                        =
ECHO =========================================================
ECHO.


SET FILENAME=hello.asm

SET MASMEXE="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\ml64.exe"

SET WINDOWSSDKLIBS=C:\Program Files (x86)\Windows Kits SDK\10\Lib\10.0.18362.0\um\x64\

SET kernel32="%WINDOWSSDKLIBS%kernel32.lib"
SET User32="%WINDOWSSDKLIBS%User32.Lib"
SET "LIBS=%kernel32% %User32%"


%MASMEXE% /nologo %FILENAME% /link /nologo /subsystem:windows /entry:main /defaultlib:%LIBS%
