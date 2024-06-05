@ECHO off


rem C:\Windows\System32\cmd.exe /min /C "set __COMPAT_LAYER=RUNASINVOKER && start %1"

cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" %1"
