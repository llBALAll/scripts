@ECHO OFF
rem THIS SCRIPT IS TO RUN MASM FROM NOTEPAD++ BY CREATING A SHOTCUT IN RUN MENU;
rem I CODED THIS BECAUSE LIKE TO USE JUST ONE SCRIPT TO BUILD EVERY PROJECT;
rem PLACE THIS SCRIPT ON A DIRECTORY THAT YOU WANT AND MODIFY:
rem -> "PATH_TO_THIS_SCRIPT" WITH THE PATH THAT YOU PLACE IT
rem -> VISUAL STUDIO MASM AND WINDOWS SDK LIBS PATHS 
rem -> INCLUDE OR REMOVE LIBS


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

SET WINDOWSSDKLIBS=C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x64\

SET kernel32="%WINDOWSSDKLIBS%kernel32.lib"
SET User32="%WINDOWSSDKLIBS%User32.Lib"

SET "LIBS=%kernel32% %User32%"

%MASMEXE% %FILEPATHNAME% /link /subsystem:windows /entry:main /defaultlib:%LIBS%
rem %MASMEXE% /nologo %FILENAME% /link /nologo /subsystem:windows /entry:main /defaultlib:%LIBS%
pause