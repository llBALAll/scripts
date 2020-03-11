@ECHO OFF

rem TO USE THIS SCRIPT MODIFY PYTHONEXE PATH WITH PATH OF PYTHON ON YOUR PC;
rem PLACE THIS SCRIPT ON A DIRECTORY THAT YOU WANT AND MODIFY:
rem -> "PATH_TO_THIS_SCRIPT" WITH THE PATH THAT YOU PLACE IT

rem IN NOTEPAD++ -> RUN -> RUN... -> PASTE THE COMMAND: 
rem "PATH_TO_THIS_SCRIPT" $(CURRENT_DIRECTORY) $(FILE_NAME)
rem SAVE, PUT A NAME AND CHOOSE THE SHOTCUT, OK


ECHO.
ECHO ---------------------------------------------------------
ECHO -                    Python 2.7 RUN                     -
ECHO ---------------------------------------------------------
ECHO.


cd %1

SET "FILEPATHNAME=%1\%2"

echo %FILEPATHNAME%

SET  PYTHONEXE="C:\Python2.7\python.exe"

%PYTHONEXE% %FILEPATHNAME%

