$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20160729/ImDiskTk.exe/download'
$checksum32  = 'ea613926a362563c39793871c28207990c775304f71b75347175ce667a517415'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/fullsilent'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs
