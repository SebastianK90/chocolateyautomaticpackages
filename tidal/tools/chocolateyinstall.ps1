$ErrorActionPreference = 'Stop'

$packageName = 'tidal'
$url32       = 'http://download.tidal.com/desktop/TIDALSetup.exe'
$checksum32  = 'adf0ac3640008d12f2b069a570de133cdfc67dd77f8e51fc98408537178044d3'

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
