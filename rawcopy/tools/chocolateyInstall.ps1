$ErrorActionPreference = 'Stop'

$packageName = 'rawcopy'
$url32       = 'http://ltr-data.se/files/rawcopy.zip'
$url64       = 'http://ltr-data.se/files/win64/rawcopy64.zip'
$checksum32  = 'a66d00d96c08291923dee1af5b9a61892e60dd80115602f3f3eaedc092372cef'
$checksum64  = 'af94badd91afe11f3f4ec7b9b17d2e0a1aa52e6baf28500cd2a791351e1742ff'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
  
Install-ChocolateyPath $toolsPath
