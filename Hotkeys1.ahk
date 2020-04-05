;0xC00000 (sem borda)
;0xCF0000 (sem titulo e sem borda)

;(win+b) toogle borderless on a program window
#b:: 
borderless := WinExist("A")
WinSet, Style, ^0xCF0000, ahk_id %borderless%
return

;(ctrl+alt+t) open 1 terminal borderless move/resize placed down
^!t::
run, "C:\Users\vinny\Desktop\atalhos\cmd0.bat"
WinWait, cmd0.bat
cmd0 := WinExist("A")
WinSet, Style, ^0xCF0000, ahk_id %cmd0%
WinMove, cmd0.bat, , 450, 685, 868, 351
return

;(ctrl+alt+y) open 2 terminals borderless move/resize side by side
^!y::
run, "C:\Users\vinny\Desktop\atalhos\cmd1.bat", C:\, , cmd1
WinWait, cmd1.bat
cmd1 := WinExist("A")
run, "C:\Users\vinny\Desktop\atalhos\cmd2.bat", C:\, , cmd2
WinWait, cmd2.bat
cmd2 := WinExist("A")
WinSet, Style, ^0xCF0000, ahk_id %cmd1%
WinSet, Style, ^0xCF0000, ahk_id %cmd2%
WinMove, cmd1.bat, , 101, 140, 884, 895
WinMove, cmd2.bat, , 1000, 140, 905, 895
return

;(ctrl+alt+w) open sublime and terminal borderless move/resize side by side
^!w::
run, "C:\Vinicius\bin\Sublime Text Build 3211 x64\sublime_text.exe", C:\, , sublime
sleep, 200
sublime := WinExist("A")
run, "C:\Users\vinny\Desktop\atalhos\cmd2.bat", C:\, , cmd2
WinWait, cmd2.bat
cmd2 := WinExist("A")
WinSet, Style, ^0xCF0000, ahk_id %sublime%
WinSet, Style, ^0xCF0000, ahk_id %cmd2%
WinMove, ahk_id %sublime%, , 101, 140, 884, 895
WinMove, cmd2.bat, , 1000, 140, 905, 895
return