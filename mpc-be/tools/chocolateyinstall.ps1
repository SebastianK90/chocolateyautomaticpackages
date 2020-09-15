$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$silentArgs = '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP-'
$fileType   = 'exe'

$packageArgs = @{
  packageName = 'mpc-be'
  file        = gi $toolsPath\*_x32.zip
  file64      = gi $toolsPath\*_x64.zip
  destination = $toolsPath
}

Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

$FileFullPath = Get-ChildItem $toolsPath -Recurse -Include *.exe | Sort-Object -Descending | Select-Object -First 1

Install-ChocolateyInstallPackage -packageName 'mpc-be' $fileType $silentArgs $FileFullPath

$regkey = Get-InstallRegistryKey "MPC-BE*"
Install-ChocolateyPath $regkey.InstallLocation
