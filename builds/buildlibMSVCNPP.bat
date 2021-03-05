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
ECHO -            MSVC C++ Build Static LIB 64b              -
ECHO ---------------------------------------------------------
ECHO.

cd %1
SET "FILEPATHNAME=%1\%2"
SET "FILEPATHNAMEOBJ=%1\%3.obj"
SET "FILEPATHNAMELIB=%1\%3.lib"

SET MSVCPATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64"
SET "MSVCCL=%MSVCPATH%\cl.exe"
SET "MSVCLIB=%MSVCPATH%\lib.exe"

SET "I1="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\include""
SET "I2="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\um""
SET "I3="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\ucrt""
SET "I4="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\shared""
SET "I5="C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\winrt""
SET "I6="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\atlmfc\include""
SET "INCPATHS=/I%I1% /I%I2% /I%I3% /I%I4% /I%I5% /I%I6%"

SET "L1="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\lib\x64""
SET "L2="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x64""
SET "L3="C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\ucrt\x64""
SET "L4="C:\Program Files (x86)\Microsoft Visual Studio\2019\ProfessionalNET\VC\Tools\MSVC\14.24.28314\atlmfc\lib\x64""
SET "LIBPATHS=/LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3% /LIBPATH:%L4%"

SET "COMPILEROPTS=/c /Zc:wchar_t /W1 /O2 /fp:precise /Gd /GS /Gm- /Zc:inline /errorReport:prompt /WX- /FC /EHsc"
rem SET "COMPILEROPTS=/Zc:wchar_t /W1 /O2 /fp:precise /Gd /GS /MD /Gm- /Zc:inline /errorReport:prompt /WX- /FC /EHsc"

SET "LINKOPTS=/NXCOMPAT /DYNAMICBASE /MACHINE:X64 /INCREMENTAL:NO /MANIFESTUAC:"level='asInvoker' uiAccess='false'""

SET "LIBS=kernel32.lib user32.lib Shell32.lib"

ECHO -- Compiling (generating .obj) --
ECHO.
rem pause > NUL
%MSVCCL% %FILEPATHNAME% %INCPATHS% %COMPILEROPTS%
ECHO.
ECHO -- Press enter to generate .lib --
ECHO.
pause > NUL
%MSVCLIB% /OUT:%FILEPATHNAMELIB% %FILEPATHNAMEOBJ%
