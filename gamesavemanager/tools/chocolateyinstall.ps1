$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName = 'gamesavemanager'
  FileFullPath   = "$toolsPath\GameSaveManager_3.1.571.0_x32.zip"
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

$FileFullPath = get-childitem $toolsPath -Recurse -Filter "gs_mngr*" -Include *.exe | select -First 1

Remove-Item $packageArgs['FileFullPath'] -EA 0

$FileFullPath = Get-ChildItem $toolsPath -Recurse -Include *.exe | Sort-Object -Descending | Select-Object -First 1

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\GameSave Manager 3.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
