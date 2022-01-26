$ErrorActionPreference = 'Stop'

$packageName = 'tidal'
$url32       = 'http://download.tidal.com/desktop/TIDALSetup.exe'
$checksum32  = '020685eeacf1857c34d6f034b94616e4ff45634eeb95bb720be667ed364de7ff'

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
