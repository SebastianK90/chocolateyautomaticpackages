$ErrorActionPreference = 'Stop'

$packageName = 'telegram.install'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.4.3/tsetup.1.4.3.exe'
$checksum32 = 'f326a2fa675b5ff4325a463baa1bec5d13055a9e3aa230c42dc97a37358fed2f'
		  
						  
$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
