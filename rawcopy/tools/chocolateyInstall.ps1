$ErrorActionPreference = 'Stop'

$packageName = 'rawcopy'
$url32       = 'http://ltr-data.se/files/rawcopy.zip'
$url64       = 'http://ltr-data.se/files/win64/rawcopy64.zip'
$checksum32  = '1D3F51FADDEE222BE534A284D3C7905FF1353B905EBBEDC376ECB5D216EAEE0A'
$checksum64  = '460AA2CF39917DF4EA0C011A4472FE78F0133C191D8BB7BBA3342311FD1C0841'
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
