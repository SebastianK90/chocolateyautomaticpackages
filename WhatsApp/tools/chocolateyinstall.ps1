$ErrorActionPreference = 'Stop'

$packageName = 'whatsapp'
$url32       = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
$url64       = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
$checksum32  = '519321addba03bfb46b8f978c910df3e017a860a670e0d22a88c09051611ae7a'
$checksum64  = '4095c9025648f398bb1d276cbcdf6a63de58870d3f7b85f6f9199247d4a37113'

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
