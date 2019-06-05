$ErrorActionPreference = 'Stop'

$packageName = 'whatsapp'
$url32       = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
$url64       = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
$checksum32  = '674336614ffcf0709d17a8472438d15b1d6717c037b4d6bf55e854e4fe8d7e28'
$checksum64  = 'd8a83cbf15f7011ddca7db7ac18264585c697d64a9b4002ce2455ed6c005ab98'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  url64bit               = $url64
  silentArgs             = '--silent'
  checksum               = $checksum32
  checksum64             = $checksum64
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
