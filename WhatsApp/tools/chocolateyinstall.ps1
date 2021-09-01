$ErrorActionPreference = 'Stop'

$packageName = 'whatsapp'
$url32       = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
$url64       = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
$checksum32  = '82f147b6ff3ee9ef3bd7554923c1e71b98ce37a8494b2f512570caf191be1cc1'
$checksum64  = '556283f58b52f8936d9f32c817d2dc3ed43b75a83e3e96bca0508138880eb96a'

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
