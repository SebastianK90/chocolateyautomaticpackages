$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$silentArgs     = '/fullsilent'

$packageArgs = @{
  packageName    = 'ImDisk-Toolkit'
  softwareName   = 'imdisk-toolkit*'
  fileType       = 'zip'
  file           = gi $toolsPath\*_x32.zip
  file64         = gi $toolsPath\*_x64.zip

  validExitCodes = @(0)
  destination    = $toolsPath
}
Get-ChocolateyUnzip @packageArgs
Get-ChocolateyUnzip (Get-ChildItem $toolsPath\*.cab -Recurse) $toolsPath

Remove-Item $toolsPath\*.zip -ea 0

$FileFullPath = Get-ChildItem $toolsPath -Recurse -Include config.exe | Sort-Object -Descending | Select-Object -First 1

Start-ChocolateyProcess $silentArgs $FileFullPath