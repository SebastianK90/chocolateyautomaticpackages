$ErrorActionPreference = 'Stop'

$packageName = 'tidal'
$url32       = 'http://download.tidal.com/desktop/TIDALSetup.exe'
$checksum32  = 'f8bb5d069b02e4a2856c6328423819c181499ae3e4bb828a2bf68ee739115825'

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
