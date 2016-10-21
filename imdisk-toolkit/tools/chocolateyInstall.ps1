$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20161021/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20161021/ImDiskTk-x64.exe/download'
$checksum32  = '90a167f596131c25aa599fe0a8242f09e3d0ddec0630c023f1c20226fc210c1d'
$checksum64  = 'e61649d079d1f4eab0ef488edba2d2cd3e8a6f6f873c185a3fdf75005d66055f'


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
