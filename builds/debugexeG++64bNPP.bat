@ECHO OFF

rem THIS SCRIPT IS TO RUN MSVC FROM NOTEPAD++ BY CREATING A SHOTCUT IN RUN MENU;
rem I CODED THIS BECAUSE LIKE TO USE JUST ONE SCRIPT TO BUILD EVERY PROJECT;
rem PLACE THIS SCRIPT ON A DIRECTORY THAT YOU WANT AND MODIFY:
rem -> "PATH_TO_THIS_SCRIPT" WITH THE PATH THAT YOU PLACE IT
rem -> MINGW INCLUDES AND LIBS PATHS
rem -> COMPILEROPTS AND LINKOPTS

rem IN NOTEPAD++ -> RUN -> RUN... -> PASTE THE COMMAND: 
rem "PATH_TO_THIS_SCRIPT" $(CURRENT_DIRECTORY) $(FILE_NAME) $(NAME_PART)
rem SAVE, PUT A NAME AND CHOOSE THE SHOTCUT, OK

ECHO.
ECHO ---------------------------------------------------------
ECHO -              MINGW GCC 64b C++ debug exe              -
ECHO ---------------------------------------------------------
ECHO.

cd %1
SET "FILEPATHNAME=%1\%2"
SET "DIRNAMEPART=%1\%3"

SET GCCPATH="C:\mingw64\bin"

SET "GCCEXE=%GCCPATH%\x86_64-w64-mingw32-g++.exe"

SET "I1="C:\mingw64\x86_64-w64-mingw32\include""
SET "I2="C:\mingw64\lib\gcc\x86_64-w64-mingw32\8.1.0\include""
SET "I3="C:\mingw64\lib\gcc\x86_64-w64-mingw32\8.1.0\include\c++""

SET "COMPILEROPTS=-g -Wall -fexceptions -O2"

SET "LINKOPTS=-static-libgcc -static-libstdc++ -Wl,--nxcompat -Wl,--dynamicbase"
rem SET "LINKOPTS=-s -static -Wl,--nxcompat -Wl,--dynamicbase"

SET "L1="C:\mingw64\x86_64-w64-mingw32\lib""

rem %GCCEXE% %FILEPATH%\%FILENAME%.c -o %FILEPATH%\%FILENAME%.exe

rem %GCCEXE% %COMPILEROPTS% -I%I1% -I%I2% -I%I3% -c %FILEPATH%\%FILENAME%.c -o %FILEPATH%\%FILENAME%.o & 
rem %GCCEXE% -L%L1% -o %FILEPATH%\%FILENAME%.exe %FILEPATH%\%FILENAME%.o %LINKOPTS%

%GCCEXE% %COMPILEROPTS% -I%I1% -I%I2% -I%I3% -c %FILEPATHNAME% -o %DIRNAMEPART%.o & 
%GCCEXE% -L%L1% -o %DIRNAMEPART%.exe %DIRNAMEPART%.o %LINKOPTS%

rem pause