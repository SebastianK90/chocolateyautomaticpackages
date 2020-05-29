$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$silentArgs = '/S'
$fileType   = 'exe'

$packageArgs = @{
  packageName = 'oldcalc'
  file        = gi $toolsPath\*_x32.zip
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

$FileFullPath = Get-ChildItem $toolsPath -Recurse -Include *.exe | Sort-Object -Descending | Select-Object -First 1

Install-ChocolateyInstallPackage -packageName 'oldcalc' $fileType $silentArgs $FileFullPath