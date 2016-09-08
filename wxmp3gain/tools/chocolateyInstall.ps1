$ErrorActionPreference = 'Stop'

$packageName = 'wxmp3gain'
$url32       = 'https://sourceforge.net/projects/wxmp3gain/files/3.7/wxmp3gain-v3.7-win32-setup.exe/download'
$checksum32  = '4ddb5df248e8f52104d4455fc3279ade376b7131e21be5ef10da99b0b4b86239'
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
