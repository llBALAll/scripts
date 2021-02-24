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
ECHO -              MINGW GCC 32b C++ build exe              -
ECHO ---------------------------------------------------------
ECHO.

cd %1
SET "FILEPATHNAME=%1\%2"
SET "DIRNAMEPART=%1\%3"

SET GCCPATH="C:\MinGW32b\bin"
SET "GCCEXE=%GCCPATH%\mingw32-gcc.exe"

SET "I1="C:\MinGW32b\include""
SET "I2="C:\MinGW32b\lib\gcc\mingw32\8.2.0\include""
SET "I3="C:\MinGW32b\lib\gcc\mingw32\8.2.0\include\c++""

SET "COMPILEROPTS=-Wall -fexceptions -O2"

SET "LINKOPTS=-Wl,--nxcompat -Wl,--dynamicbase"
rem SET "LINKOPTS=-s -static -Wl,--nxcompat -Wl,--dynamicbase"

SET "L1="C:\MinGW32b\lib""
SET "L2="C:\MinGW32b\lib\gcc\mingw32\8.2.0""

rem %GCCEXE% %FILEPATHNAME% -o %FILEPATH%\%FILENAME%.exe

%GCCEXE% %COMPILEROPTS% -I%I1% -I%I2% -I%I3% -c %FILEPATHNAME% -o %DIRNAMEPART%.o & 
%GCCEXE% -L%L1% -L%L2% -o %DIRNAMEPART%.exe %DIRNAMEPART%.o %LINKOPTS%

rem pause