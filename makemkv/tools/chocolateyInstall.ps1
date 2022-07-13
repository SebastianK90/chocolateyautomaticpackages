$ErrorActionPreference = 'Stop'

$packageName = 'MakeMKV'
$url32       = 'https://www.makemkv.com/download/Setup_MakeMKV_v1.17.1.exe'
$checksum32  = '4924c91d57aa90f442016ca24de3373e1eb141196e56f0299cc88f2934e94dca'
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
