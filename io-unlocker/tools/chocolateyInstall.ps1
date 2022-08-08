$ErrorActionPreference = 'Stop'

$packageName = 'io-unlocker'
$url32       = 'https://cdn.iobit.com/dl/unlocker-setup.exe'
$checksum32  = '18e6243b74cf5a5f9a2ba5cf243f3b89ce0fb9da4c3a30bbfbd0ae932d621f52'
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
