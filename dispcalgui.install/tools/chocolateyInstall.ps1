$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.install'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.0.0/DisplayCAL-3.7.0.0-Setup.exe/download'
$checksum32  = 'BC16193229BABBA144A09357483FEBB4DFC59EF7421DBE69C1127F5891487A99'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs