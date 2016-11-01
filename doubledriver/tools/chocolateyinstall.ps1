$ErrorActionPreference = 'Stop'

$packageName = 'doubledriver'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$FileFullPath = get-childitem $toolsPath -recurse -include dd.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Double Driver.lnk" $FileFullPath
