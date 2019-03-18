$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.install'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.2.0/DisplayCAL-3.7.2.0-Setup.exe/download'
$checksum32  = '354f4bccc8f01325cfb4a868f1df8ad3750b929d7ceee3ba3c9cef19b3240547'

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
