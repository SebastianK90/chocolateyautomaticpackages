$ErrorActionPreference = 'Stop'

$packageName = 'gpmdp'
$url32       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.4.1/Google.Play.Music.Desktop.Player.Setup.exe'
$checksum32  = 'a949bb8355c50463162f5c52aaa0ecdab3b762b924371c83feffc6265b1ead7a'

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
