$ErrorActionPreference = 'Stop'

$packageName = 'tidal'
$url32       = 'http://download.tidal.com/desktop/TIDALSetup.exe'
$checksum32  = '52db8d6f523a2352e20106521fd2f810537720502a4d97277bdbabfdcbeefe19'

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
