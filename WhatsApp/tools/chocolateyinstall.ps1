$ErrorActionPreference = 'Stop'

$packageName = 'whatsapp'
$url32       = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
$url64       = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
$checksum32  = '84baae2303d9d33650b5710763d934a7eb83e364ce71bcf1a68a7ba7acdb31b7'
$checksum64  = 'f7bb88b05b99f6c9f1fccbdd2546158c78c3d4b7d7f6755590b2a6b77311e18f'

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
