$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20181221/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20181221/ImDiskTk-x64.exe/download'
$checksum32  = 'c62ca0ba756252d1dc03f0b130f13bcf459d9e5540638d55cb74e61bbbb434c2'
$checksum64  = '3fa9a3c1967dfbd064939017d8cb5d6568bd8d4da6e0398ca1d1c77861c95b2c'


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
