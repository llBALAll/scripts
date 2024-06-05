@ECHO OFF

SET cygwin64PATH=C:\Vinicius\bin\cygwin64\bin

SET PATH=%PATH%;%cygwin64PATH%

e:

cd "E:\Vinicius\linux\shell"

REM bash refresh_dnscache.sh domains.txt 55
bash refresh_dnscache.sh %1 %2
