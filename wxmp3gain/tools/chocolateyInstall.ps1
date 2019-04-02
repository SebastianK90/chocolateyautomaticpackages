$ErrorActionPreference = 'Stop'

$packageName = 'wxmp3gain'
$url32       = 'https://sourceforge.net/projects/wxmp3gain/files/4.0/wxmp3gain-4.0-win32-setup.exe/download'
$checksum32  = 'a5f1879d9e2eacf104e4a8bfbd0361226ed2b991090514a7d8d9d46041c8e13e'
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
