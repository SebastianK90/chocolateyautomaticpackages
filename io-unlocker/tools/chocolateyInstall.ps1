$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'https://cdn.iobit.com/dl/unlocker-setup.exe'
$checksum32  = '2efdffd1cf3adab21ff760f009d8893d8c4cbcf63b2c3bfcc1139457c9cd430b'
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
