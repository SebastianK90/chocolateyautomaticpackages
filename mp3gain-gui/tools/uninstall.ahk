#NoTrayIcon
Loop, 3
{
go = true
if go = true
{
sleep 1000
IfWinActive, ahk_class #32770
SetControlDelay -1
ControlClick, Button1, ahk_class #32770
}
}