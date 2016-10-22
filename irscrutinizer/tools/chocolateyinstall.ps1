$ErrorActionPreference = 'Stop'

$packageName = 'irscrutinizer'
$url32       = 'https://github.com/bengtmartensson/harctoolboxbundle/releases/download/Version-1.3/IrScrutinizer-1.3.exe'
$checksum32  = '0e14c48d1e2fb87d539dd7fd566f28baff5b3dcdd048249fdc48712c846a686f'

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
