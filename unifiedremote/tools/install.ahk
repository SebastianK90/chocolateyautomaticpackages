#NoTrayIcon
sleep 1000
WinWait, Windows ahk_class #32770 ahk_exe rundll32.exe, , 40
SetControlDelay -1
ControlClick, Button1, Windows ahk_class #32770 ahk_exe rundll32.exe