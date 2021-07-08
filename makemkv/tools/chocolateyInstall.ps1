$ErrorActionPreference = 'Stop'

$packageName = 'MakeMKV'
$url32       = 'https://www.makemkv.com/download/Setup_MakeMKV_v1.16.4.exe'
$checksum32  = '51f3655c89ba5f5fbc05cbd97addf85c7949ee07303f37e04800f25b27c19380'
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
