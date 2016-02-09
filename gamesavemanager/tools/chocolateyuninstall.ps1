$icon_name = (Get-ChildItem "$env:USERPROFILE\Desktop" -Filter "GameSave Manager 3.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue