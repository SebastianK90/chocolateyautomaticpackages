$ErrorActionPreference = 'Stop'

$packageName = 'rawcopy'
$url32       = 'http://ltr-data.se/files/rawcopy.zip'
$url64       = 'http://ltr-data.se/files/win64/rawcopy64.zip'
$checksum32  = '89a4bb16b7ebc76c9596c20cfdae85b0c025f58e6998ab9e5051a5759864ee5a'
$checksum64  = '4fa1d4ad236b6efa5622e0f7835739c6d8a55c1204d402e1d332ee8fb2eec12c'
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
