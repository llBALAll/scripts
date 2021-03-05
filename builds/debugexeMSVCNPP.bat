@ECHO OFF

rem THIS SCRIPT IS TO RUN MSVC FROM NOTEPAD++ BY CREATING A SHOTCUT IN RUN MENU;
rem I CODED THIS BECAUSE LIKE TO USE JUST ONE SCRIPT TO BUILD EVERY PROJECT;
rem PLACE THIS SCRIPT ON A DIRECTORY THAT YOU WANT AND MODIFY:
rem -> "PATH_TO_THIS_SCRIPT" WITH THE PATH THAT YOU PLACE IT
rem -> VISUAL STUDIO AND WINDOWS SDK INCLUDES AND LIBS PATHS 
rem -> LINKOPTS

rem IN NOTEPAD++ -> RUN -> RUN... -> PASTE THE COMMAND: 
rem "PATH_TO_THIS_SCRIPT" $(CURRENT_DIRECTORY) $(FILE_NAME)
rem SAVE, PUT A NAME AND CHOOSE THE SHOTCUT, OK

ECHO.
ECHO ---------------------------------------------------------
ECHO -                 MSVC 64b C++ debug exe                -
ECHO ---------------------------------------------------------
ECHO.

cd %1

SET "FILEPATHNAME=%1\%2"

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

rem sem otimizacao e dlls do runtime; com simbolos p/ debug
SET "COMPILEROPTS=/Zc:wchar_t /W1 /Od /fp:precise /Gd /GS /Gm- /Zi /Zc:inline /errorReport:prompt /WX- /FC /EHsc"

rem com simbolos p/ debug, DEP, ASLR; 64b
SET "LINKOPTS=/DEBUG /NXCOMPAT /DYNAMICBASE /MACHINE:X64 /INCREMENTAL:NO /MANIFESTUAC:"level='asInvoker' uiAccess='false'""

SET "LIBS=kernel32.lib user32.lib shell32.lib"

rem %MSVCEXE% %FILEPATHNAME% /I%I1% /I%I2% /I%I3% /I%I4% /I%I5% /link %LINKOPTS% /LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3%

rem %MSVCEXE% %FILEPATHNAME% /I%I1% /I%I2% /I%I3% /I%I4% /I%I5% /Zc:wchar_t /W1 /O2 /fp:precise /Gd /GS /MD /Gm- /Zc:inline /errorReport:prompt /WX- /FC /EHsc /link %LINKOPTS% /LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3% /INCREMENTAL:NO /MANIFEST /NXCOMPAT /DYNAMICBASE /MACHINE:X64 /MANIFESTUAC:"level='asInvoker' uiAccess='false'"

%MSVCEXE% %FILEPATHNAME% /I%I1% /I%I2% /I%I3% /I%I4% /I%I5% %COMPILEROPTS% /link %LINKOPTS% /LIBPATH:%L1% /LIBPATH:%L2% /LIBPATH:%L3% /defaultlib:%LIBS%

rem pause