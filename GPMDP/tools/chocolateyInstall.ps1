$ErrorActionPreference = 'Stop'

$packageName = 'gpmdp'
$url32       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.0.5/Google.Play.Music.Desktop.Player.Setup.exe'
$checksum32  = 'e1032b8ad77866f6fcaf28650cf669d7afbd5e8ccedf5abb048d844bb922f05a'

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
