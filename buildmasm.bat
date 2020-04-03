@ECHO OFF
rem PLACE THIS SCRIPT IN YOUR PROJECT DIRECTORY
rem CHANGE FILENAME, VISUAL STUDIO MASM PATH AND WINDOWS SDK LIBS PATH
rem AFTER MODIFY, TO USE JUST DOUBLE CLICK IT

ECHO.
ECHO =========================================================
ECHO =                      MASM BUID                        =
ECHO =========================================================
ECHO.


SET FILENAME=hellointel.asm

SET MASMEXE="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\ml64.exe"

SET "L1="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\lib\x64""
SET "L2="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x64""
SET "L3="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\ucrt\x64""

SET "LIBS=kernel32.lib user32.lib"

%MASMEXE% %FILENAME% /link /subsystem:windows /entry:main /LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3% /defaultlib:%LIBS%

pause