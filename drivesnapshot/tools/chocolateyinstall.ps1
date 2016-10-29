$packageName = 'drivesnapshot'
$url32       = 'http://www.drivesnapshot.de/download/Setup.exe'
$checksum32  = 'f16b67cacc021f73dc745069221861842971ea913d9908dcedf0017ce727d4ea'
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

$uninstall = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall , HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
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
