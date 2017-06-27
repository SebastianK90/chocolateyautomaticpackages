$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'http://update.iobit.com/dl/unlocker-setup.exe'
$checksum32  = '09d7fcbf95e66b242ff5d7bc76e4d2c912462c8c344cb2b90070a38d27aaef53'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url32
  checksum               = $checksum32
  checksumType           = 'sha256'
  silentArgs             = '/Verysilent'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs

Get-Process iobitunlocker* | Stop-Process -Force -ErrorAction SilentlyContinue
