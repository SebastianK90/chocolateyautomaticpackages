$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'https://cdn.iobit.com/dl/unlocker-setup.exe'
$checksum32  = '2EFDFFD1CF3ADAB21FF760F009D8893D8C4CBCF63B2C3BFCC1139457C9CD430B'
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
