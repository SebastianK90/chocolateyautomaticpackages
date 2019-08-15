#NoTrayIcon
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
sleep 1000
WinWait, Windows ahk_class #32770 ahk_exe rundll32.exe, , 40
SetControlDelay -1
ControlClick, Button1, Windows ahk_class #32770 ahk_exe rundll32.exe