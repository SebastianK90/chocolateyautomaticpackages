$ErrorActionPreference = 'Stop'

$packageName = 'doubledriver'
$toolsPath   = (Split-Path -parent $MyInvocation.MyCommand.Definition)


Get-ChocolateyUnzip -FileFullPath "$toolsPath\double_driver_4.1.0_portable.zip" -Destination $toolsPath


$FileFullPath = get-childitem $toolsPath -recurse -include dd.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Double Driver.lnk" $FileFullPath