$ErrorActionPreference = 'Stop'

$packageName = 'telegram.install'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.5.2/tsetup.1.5.2.exe'
$checksum32 = 'd8ca49e7045b44cf5bd26fbdea022b285620198b33fef3d224f8404f10e7d96c'
		  
						  
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
