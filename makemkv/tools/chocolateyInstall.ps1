$ErrorActionPreference = 'Stop'

$packageName = 'MakeMKV'
$url32       = 'https://www.makemkv.com/download/Setup_MakeMKV_v1.16.0.exe'
$checksum32  = 'f9bc8d0049b9fe2d67587990409790cb5b72cdb3e4018eb354f2d63d7ad7e9a4'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

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
