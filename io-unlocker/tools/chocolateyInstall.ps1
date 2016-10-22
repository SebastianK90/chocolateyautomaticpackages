$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'http://update.iobit.com/dl/unlocker-setup.exe'
$checksum32  = 'c114ff90e7cb93cadea5d4af69624c5c17b7beaafe0e0285f41371fe5c68b76d'
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