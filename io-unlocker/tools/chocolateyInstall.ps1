$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'https://cdn.iobit.com/dl/unlocker-setup.exe'
$checksum32  = 'AE8E0CAB1786A619E0E0CB044209E5DE7A6A30375DD88400C59551061F318A68'
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
