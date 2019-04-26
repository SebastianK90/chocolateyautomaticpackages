$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.install'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.8.0.0/DisplayCAL-3.8.0.0-Setup.exe/download'
$checksum32  = 'f04b2e871cdb02fe8388c2b1c9fd0a96c991719edbf18e907f8dfa5e7bf40db7'

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
