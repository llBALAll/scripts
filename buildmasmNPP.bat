@ECHO OFF
rem THIS SCRIPT IS TO RUN MASM FROM NOTEPAD++ BY CREATING A SHOTCUT IN RUN MENU;
rem I CODED THIS BECAUSE LIKE TO USE JUST ONE SCRIPT TO BUILD EVERY PROJECT;
rem PLACE THIS SCRIPT ON A DIRECTORY THAT YOU WANT AND MODIFY:
rem -> "PATH_TO_THIS_SCRIPT" WITH THE PATH THAT YOU PLACE IT
rem -> VISUAL STUDIO MASM AND WINDOWS SDK LIBS PATHS 
rem -> INCLUDE OR REMOVE LIBS AT: SET "LIBS=...."

rem IN NOTEPAD++ -> RUN -> RUN... -> PASTE THE COMMAND: 
rem "PATH_TO_THIS_SCRIPT" $(CURRENT_DIRECTORY) $(FILE_NAME)
rem SAVE, PUT A NAME AND CHOOSE THE SHOTCUT, OK

ECHO.
ECHO =========================================================
ECHO =                      MASM BUID                        =
ECHO =========================================================
ECHO.

cd %1
SET "FILEPATHNAME=%1\%2"
SET MASMEXE="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\ml64.exe"

SET "L1="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\lib\x64""
SET "L2="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x64""
SET "L3="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\ucrt\x64""

SET "LIBS=kernel32.lib user32.lib"

%MASMEXE% %FILEPATHNAME% /link /subsystem:windows /entry:main /LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3% /defaultlib:%LIBS%

pause