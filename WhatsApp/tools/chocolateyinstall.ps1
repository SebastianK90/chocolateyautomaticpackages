$ErrorActionPreference = 'Stop'

$packageName = 'whatsapp'
$url32       = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
$url64       = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
$checksum32  = 'daa78156140b65d178febec34ba37d7f3dbe370c00ebbda772408413bda90ca7'
$checksum64  = '030528ac9177284145e1742514073d2a25ee01360d04cd770ded8bbfd9c95d2a'

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
