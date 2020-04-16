$ErrorActionPreference = 'Stop'

$packageName = 'MakeMKV'
$url32       = 'https://www.makemkv.com/download/Setup_MakeMKV_v1.15.1.exe'
$checksum32  = 'e219ff9fdf45a71ceb3aa55615648b43d8efa64b098459d9cec9741de11dd966'
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
