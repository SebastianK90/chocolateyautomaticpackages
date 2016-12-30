$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20161230/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20161230/ImDiskTk-x64.exe/download'
$checksum32  = '3a9ca5a76529f78353fd13f28a6e550c50efd3b04d7480317cc3b9b7e35ce1f0'
$checksum64  = '50344fb1f69ed39ab9e75ed7eb2226981125a9a020b3acea7b2ff103a64aa6eb'


$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  url64bit               = $url64
  silentArgs             = '/fullsilent'
  checksum               = $checksum32
  checksum64             = $checksum64
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs
