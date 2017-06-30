Get-Process CCleaner* | Stop-Process -Force -ErrorAction SilentlyContinue

$settings = Get-Item "$toolsPath\ccleaner.ini" -ErrorAction SilentlyContinue
$ccleaner_temp = "$env:USERPROFILE\ccleaner_temp"

if($settings -ne $null)
    {
    Move-Item "$settings" $ccleaner_temp -Force
    }
