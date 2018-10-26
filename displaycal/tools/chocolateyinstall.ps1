$ErrorActionPreference = 'Stop'

$packageName = 'displaycal'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.0.0/DisplayCAL-3.7.0.0-Setup.exe/download'
$checksum32  = 'bc16193229babba144a09357483febb4dfc59ef7421dbe69c1127f5891487a99'

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
