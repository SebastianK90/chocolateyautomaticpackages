$ErrorActionPreference = 'Stop'

$packageName = 'occt.install'
$url32       = 'http://www.ocbase.com/download.php'
$checksum32  = '8a98c89fa0a475bb75d71e992e06c0570561f2f2585134ac3ed0fab70626344a'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/S'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
