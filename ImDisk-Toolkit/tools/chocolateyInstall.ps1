$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20170407/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20170407/ImDiskTk-x64.exe/download'
$checksum32  = 'cbc8b3877f1761032b316b180d80052015e9e737061f83052472a82c4ce2b31d'
$checksum64  = '6c9a5e150217ed8bbfe80532f0730eb1f7b29e41520a3bc8e8905c8ec789402b'


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
