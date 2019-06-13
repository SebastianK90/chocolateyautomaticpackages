$ErrorActionPreference = 'Stop'

$packageName = 'irscrutinizer'
$url32       = 'https://github.com/bengtmartensson/harctoolboxbundle/releases/download/Version-1.4.3/IrScrutinizer-1.4.3.exe'
$checksum32  = '619c2bb64ac793a9f448a728576950080d82b40f0eec13f1b3801dfb0e7b13d9'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs
