﻿$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'telegram.install'
  fileType       = 'exe'
  FileFullPath   = "$toolsPath\tsetup.5.7.2_x32.exe"
  FileFullPath64 = "$toolsPath\tsetup-x64.5.7.2_x64.exe"
  silentArgs     = '/Verysilent'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
ls $toolsPath\*.exe | % { rm $_ -ea 0; if (Test-Path $_) { sc "$_.ignore" "" }}

$packageName = $packageArgs.packageName
$installLocation = Get-AppInstallLocation $packageName
if (!$installLocation)  { Write-Warning "Can't find $packageName install location"; return }
Write-Host "$packageName installed to '$installLocation'"

Register-Application "$installLocation\$packageName.exe"
Write-Host "$packageName registered as $packageName"
