Get-Process "AIDA64*" | Stop-Process -Force -ErrorAction SilentlyContinue
$settings_lic = Get-Item "$toolsPath\pkey.txt","$toolsPath\aida64.ini" -ErrorAction SilentlyContinue
$aida64_temp = "$env:USERPROFILE\aida64_temp"

if($settings_lic -ne $null)
    {
    Move-Item "$settings_lic" $aida64_temp -Force
    }
