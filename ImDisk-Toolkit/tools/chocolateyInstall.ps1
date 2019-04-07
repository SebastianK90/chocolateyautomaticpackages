$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20190407/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20190407/ImDiskTk-x64.exe/download'
$checksum32  = 'b0da90ce2a03af0b1bd667e9d8eacf9663145dae1b55886742fb577a37360ded'
$checksum64  = '3938209b4713d3cbe92fd3678ea0bd15edbf6f887d81194e3c9bc19c9ab0720f'


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
