$ErrorActionPreference = 'Stop'

$url32 = 'https://partner.pcloud.com/dl/win'
$url64 = 'https://partner.pcloud.com/dl/win64'
$checksum32  = '483fc76f2279b90ec4b8bd0232aeb6cb6cb390e854595dbf9552802ff0269fdc'
$checksum64  = '4f8f898f638bab0580bc5680a6af633ca5c76314600aef393232c3a76357ff1f'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  softwareName   = 'pcloud*'
  silentArgs     = '/install /quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
