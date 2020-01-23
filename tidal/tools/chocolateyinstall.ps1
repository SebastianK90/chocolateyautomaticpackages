$ErrorActionPreference = 'Stop'

$packageName = 'tidal'
$url32       = 'http://download.tidal.com/desktop/TIDALSetup.exe'
$checksum32  = '7e381f07c72d87407ed0e2aa67c1638d30f2ea5ff34289d6205902719a527ec8'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '--silent'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
