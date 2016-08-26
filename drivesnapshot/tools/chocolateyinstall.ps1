$ErrorActionPreference = 'Stop'

$packageName = 'drivesnapshot'
$url32       = 'http://www.drivesnapshot.de/download/Setup.exe'
$checksum32  = 'b8ec20562e8b8cc8737758a422cb342767636c0db79b5accfea49ff14a8efc13'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url32
  checksum               = $checksum32
  checksumType           = 'sha256'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs

$uninstall = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -like "Snapshot*" } |
            Select-Object -Property DisplayName, UninstallString

$installpath = ($uninstall.UninstallString).Replace('uninstall.exe','')
$bits = Get-ProcessorBits
if ($bits -eq 64)
{
Install-ChocolateyPath $installpath
}
else
{
Install-ChocolateyPath $installpath
}
