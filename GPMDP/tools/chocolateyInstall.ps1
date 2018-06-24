$ErrorActionPreference = 'Stop'

$packageName = 'gpmdp'
$url32       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.6.0/Google.Play.Music.Desktop.Player.Setup.exe'
$checksum32  = 'b13c1fa8cfbfcf1777550838f8e47474d529bbedeaf0d08f0a2bcac4d969099f'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/silent'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
