$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20161017/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20161017/ImDiskTk-x64.exe/download'
$checksum32  = '189fd47c5569a355fd3479834396ce5137bd670a0f0accec592e2fb56eebf881'
$checksum64  = 'e7c9d5450a5a4d3f97d56eddf9a3fdd27dc76a1e3e87852e7ed1216e8fdbdf35'


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
