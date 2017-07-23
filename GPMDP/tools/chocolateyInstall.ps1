$ErrorActionPreference = 'Stop'

$packageName = 'gpmdp'
$url32       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v4.4.0/Google.Play.Music.Desktop.Player.Setup.exe'
$checksum32  = '468735817f1981cf83b3bc85b8a4a20f7597038548200139e3c1ce1757e9c65f'

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
