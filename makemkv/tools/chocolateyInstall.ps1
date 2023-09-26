$ErrorActionPreference = 'Stop'

$packageName = 'MakeMKV'
$url32       = 'https://www.makemkv.com/download/Setup_MakeMKV_v1.17.5.exe'
$checksum32  = 'a87a97e22901b154b8c42827f5e2bee6545bd07a6534494ac6e8e97d6d6cb60e'
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
