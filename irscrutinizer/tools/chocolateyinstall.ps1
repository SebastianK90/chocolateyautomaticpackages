$ErrorActionPreference = 'Stop'

$packageName = 'irscrutinizer'
$url32       = 'https://github.com/bengtmartensson/harctoolboxbundle/releases/download/Version-1.4.1/IrScrutinizer-1.4.1.exe'
$checksum32  = '101163ce358eeab5b74f68e27ec9ff76961c80ef854c75c2de88fd2aeed80e3c'

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
