$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'http://update.iobit.com/dl/unlocker-setup.exe'
$checksum32  = 'e5c1b479630e958e8f8e07ac42d43dcdb8d5ac639b20ebb1515fc9345f1da801'
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
