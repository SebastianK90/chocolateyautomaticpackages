Get-Process -Name aida64* -ErrorAction SilentlyContinue | Stop-Process -ErrorAction SilentlyContinue
$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "AIDA64.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue
