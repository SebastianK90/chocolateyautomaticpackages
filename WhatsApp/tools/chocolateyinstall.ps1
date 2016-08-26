$ErrorActionPreference = 'Stop'

$packageName = 'whatsapp'
$url32       = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
$url64       = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
$checksum32  = '11ad4cb8f09d07c7eb62405d319af233a7b8415dac4eec86867de271b2ad79f9'
$checksum64  = '3760c00474b974e4b14784d1ab0eeefc0b321f2e1297fe3851880a0ddbb89c9e'

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
