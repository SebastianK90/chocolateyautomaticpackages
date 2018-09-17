$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20180917/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20180917/ImDiskTk-x64.exe/download'
$checksum32  = '7bf27e1759c261fd01353575a4b3462adebb779b9a720d123cc9c907e03c5b32'
$checksum64  = 'd5630d7242d7b8dfdd617f39181bb0a481c5ce12ae6382fea1d9c2e9eb89b7c7'


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
