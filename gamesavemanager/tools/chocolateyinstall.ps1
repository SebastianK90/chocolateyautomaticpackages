$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = 'gamesavemanager'
  file        = gi $toolsPath\*_x32.zip
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

$FileFullPath = get-childitem $toolsPath -Recurse -Filter "gs_mngr*" -include *.exe | select -First 1

Remove-Item $toolsPath\*.zip -ea 0

$FileFullPath = Get-ChildItem $toolsPath -Recurse -Include *.exe | Sort-Object -Descending | Select-Object -First 1

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\GameSave Manager 3.lnk" $FileFullPath -WorkingDirectory "$toolsPath"