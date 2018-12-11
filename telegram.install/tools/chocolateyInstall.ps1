$ErrorActionPreference = 'Stop'

$packageName = 'telegram.install'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.5.1/tsetup.1.5.1.exe'
$checksum32 = '4c75f48fd0709ed85ce435514805230c322fee0bf1e04e424ce9fec301860bf7'
		  
						  
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
