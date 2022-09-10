$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "CEMU.lnk" -ErrorAction SilentlyContinue).FullName
Remove-Item $icon_name -ErrorAction SilentlyContinue
$cemu_folder = "$(Get-ToolsLocation)\cemu"
Remove-Item $cemu_folder -Recurse -Confirm:$false -ErrorAction SilentlyContinue