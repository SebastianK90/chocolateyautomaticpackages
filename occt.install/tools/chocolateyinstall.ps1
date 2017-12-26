$ErrorActionPreference = 'Stop'

$packageName = 'occt.install'
$url32       = 'http://www.ocbase.com/download/OCCTPT4.5.1.exe'
$checksum32  = '936457C564731C0FAB37E869C884F2D13F2115966C3FBD24C9167380BAF771BB'
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