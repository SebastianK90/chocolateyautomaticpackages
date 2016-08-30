$ErrorActionPreference = 'Stop'

$packageName = 'irscrutinizer'
$url32       = 'http://www.harctoolbox.org/downloads/IrScrutinizer.exe'
$checksum32  = 'bacc7005b725a34483cbdbdf8ae16c095e2657a920d74e736b688fcfe5f97943'

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
