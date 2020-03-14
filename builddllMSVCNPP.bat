@ECHO OFF

rem THIS SCRIPT IS TO RUN MSVC FROM NOTEPAD++ BY CREATING A SHOTCUT IN RUN MENU;
rem I CODED THIS BECAUSE LIKE TO USE JUST ONE SCRIPT TO BUILD EVERY PROJECT;
rem PLACE THIS SCRIPT ON A DIRECTORY THAT YOU WANT AND MODIFY:
rem -> "PATH_TO_THIS_SCRIPT" WITH THE PATH THAT YOU PLACE IT
rem -> VISUAL STUDIO AND WINDOWS SDK INCLUDES AND LIBS PATHS 
rem -> LINKOPTS

rem IN NOTEPAD++ -> RUN -> RUN... -> PASTE THE COMMAND: 
rem "PATH_TO_THIS_SCRIPT" $(CURRENT_DIRECTORY) $(FILE_NAME) $(NAME_PART)
rem SAVE, PUT A NAME AND CHOOSE THE SHOTCUT, OK

ECHO.
ECHO ---------------------------------------------------------
ECHO -                 MSVC C++ Build DLL 64b                -
ECHO ---------------------------------------------------------
ECHO.

cd %1

SET "FILEPATHNAME=%1\%2"

SET "FILEPATHNAMEDLL=%1\%3.dll"

SET MSVCPATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64"

SET "MSVCEXE=%MSVCPATH%\cl.exe"

SET "I1="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\include""
SET "I2="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\um""
SET "I3="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\ucrt""
SET "I4="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\shared""
SET "I5="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\winrt""

SET "L1="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\lib\x64""
SET "L2="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x64""
SET "L3="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\ucrt\x64""

SET "LINKOPTS=/DLL /NOENTRY /NXCOMPAT /DYNAMICBASE /MACHINE:X64"

%MSVCEXE% %FILEPATHNAME% /I%I1% /I%I2% /I%I3% /I%I4% /I%I5% /link /OUT:%FILEPATHNAMEDLL% %LINKOPTS% /LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3%

pause