$lic_path = "$env:USERPROFILE\drivesnapshot_lic"
$icon_name = (Get-ChildItem "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs" -Filter "Drive Snapshot.lnk" -ErrorAction SilentlyContinue).FullName

if(Test-Path $lic_path)
    {
    Remove-Item $lic_path -Recurse -Force -ErrorAction SilentlyContinue
    }

Remove-Item $icon_name -ErrorAction SilentlyContinue