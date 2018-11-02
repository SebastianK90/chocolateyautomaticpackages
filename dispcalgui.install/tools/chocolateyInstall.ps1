$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.install'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.1.0/DisplayCAL-3.7.1.0-Setup.exe/download'
$checksum32  = 'bb09c987ee592654a6fbf3114bcaeda191e8aadba7a5f1c31b6562b3ec901caf'

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
