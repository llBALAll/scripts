@ECHO OFF

rem script to set CPU affiniy for all process running with same name

rem modify $PROCESS in GET-PROCESS with the name of process you want to edit affinity
rem modify the number in $PROCESS.ProcessorAffinity with the binary number that corresponds to cpus you want to run the process

rem ex:
rem 255(decimal) = 1111111(binary)
rem 240 = 11110000
rem 170 = 10101010
rem 85  = 01010101
rem 84  = 01010100


Powershell "ForEach($PROCESS in GET-PROCESS firefox) { $PROCESS.ProcessorAffinity=170}"

Powershell "ForEach($PROCESS in GET-PROCESS discord) { $PROCESS.ProcessorAffinity=84}"