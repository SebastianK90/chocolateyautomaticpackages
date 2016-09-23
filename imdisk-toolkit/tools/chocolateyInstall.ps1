$ErrorActionPreference = 'Stop'

$packageName = 'imdisk-toolkit'
$url32       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20160917/ImDiskTk.exe/download'
$url64       = 'https://sourceforge.net/projects/imdisk-toolkit/files/20160917/ImDiskTk-x64.exe/download'
$checksum32  = 'b1f2133332cd794a57cab764458334b365320129ef245f93e5419858f741f430'
$checksum64  = 'd6067ca7215853176b6c38d4bbf66b058ddae040f63ed519792200687a92de41'


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
