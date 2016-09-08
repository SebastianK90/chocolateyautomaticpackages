$ErrorActionPreference = 'Stop'

$packageName = 'gpmdp'
$url32       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v3.6.0/Google.Play.Music.Desktop.Player.x86.exe'
$url64       = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v3.6.0/Google.Play.Music.Desktop.Player.x64.exe'
$checksum32  = '919ca4169e31a8f6777beb781112dfe1f808497962cbc7f7cb6851f72adbd19d'
$checksum64  = '919ca4169e31a8f6777beb781112dfe1f808497962cbc7f7cb6851f72adbd19d'

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
