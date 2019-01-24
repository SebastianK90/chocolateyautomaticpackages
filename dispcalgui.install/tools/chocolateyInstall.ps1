$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.install'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.1.4/DisplayCAL-3.7.1.4-Setup.exe/download'
$checksum32  = '62d39cb36ce274214d23d07a876704a4746a3618e02bb10adb7005aa502989fb'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs
