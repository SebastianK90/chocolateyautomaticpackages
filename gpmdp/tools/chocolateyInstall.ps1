$ErrorActionPreference = 'Stop'

$packageName = 'gpmdp'
$url32       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v3.5.0/Google.Play.Music.Desktop.Player.x86.exe'
$url64       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v3.5.0/Google.Play.Music.Desktop.Player.x64.exe'
$checksum32  = '0f2fe1f032fc508c6daea9d35e64743fe98b849e472111e5b26ade3895282364'
$checksum64  = '0f2fe1f032fc508c6daea9d35e64743fe98b849e472111e5b26ade3895282364'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  url64bit               = $url64
  silentArgs             = '/silent'
  checksum               = $checksum32
  checksum64             = $checksum64
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
