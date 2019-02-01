$ErrorActionPreference = 'Stop'

$packageName = 'telegram.install'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.5.9/tsetup.1.5.9.exe'
$checksum32 = 'c168968cd9f73300729c8def5a5499de1f8a80215a6458a1282df6ec8d4aa534'
		  
						  
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
