$ErrorActionPreference = 'Stop'

$packageName = 'occt.install'
$url32       = 'http://www.ocbase.com/download.php'
$checksum32  = 'fda5e161ffcd52ae4665b166e6a9bb2bc5c2fcf0c318b8206613a6a5d3445818'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/S'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
