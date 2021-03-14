@ECHO OFF

rem move files whose names are in the filelist.txt

set src_folder="C:\folder1"
set dst_folder="C:\folder2"

for /f "tokens=*" %%i in (filelist.txt) DO (
move "%src_folder%\%%i" "%dst_folder%"
rem echo "moved -> "%src_folder%\%%i""
)
