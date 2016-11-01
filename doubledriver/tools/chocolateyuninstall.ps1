$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "Double Driver.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue
