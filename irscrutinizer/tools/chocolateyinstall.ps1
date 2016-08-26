$ErrorActionPreference = 'Stop'

$packageName = 'irscrutinizer'
$url32       = 'http://www.harctoolbox.org/downloads/IrScrutinizer-1.1.3.exe'
$checksum32  = '488cbbe88f573455192813431bcafb1248b90c08f638ca4d5662343a1d75fe25'

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
