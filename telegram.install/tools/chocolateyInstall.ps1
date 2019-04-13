$ErrorActionPreference = 'Stop'

$packageName = 'telegram.install'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.6.7/tsetup.1.6.7.exe'
$checksum32 = 'aaedf8bffc37f7699cf2034b3929a9a507c8d5d72d254511af7fb89298cc762f'
		  
						  
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
