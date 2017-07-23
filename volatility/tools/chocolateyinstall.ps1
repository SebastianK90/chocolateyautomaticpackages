$ErrorActionPreference = 'Stop'

$packageName = 'volatility'
$url32       = 'http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_win64_standalone.zip'
$checksum32  = 'bb021f3b569bf8ee4a408b2e07b0662699894ff7eecd4473badf0ef0c58f2fce'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs