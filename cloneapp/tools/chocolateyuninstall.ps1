$icon_name = (Get-ChildItem "$env:USERPROFILE\Desktop" -Filter "CloneApp.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue