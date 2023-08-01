$ErrorActionPreference = 'Stop'

$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "Telegram.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item C:\tools\telegram.portable -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $icon_name -ErrorAction SilentlyContinue