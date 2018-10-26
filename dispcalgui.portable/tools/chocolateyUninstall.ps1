Get-Process DisplayCAL* -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "DisplayCAL.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue
