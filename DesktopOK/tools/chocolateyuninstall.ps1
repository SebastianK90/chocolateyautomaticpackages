Get-Process DesktopOK* | Stop-Process –Force -ErrorAction SilentlyContinue
$icon_name = (Get-ChildItem "$env:USERPROFILE\Desktop" -Filter "DesktopOK.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue