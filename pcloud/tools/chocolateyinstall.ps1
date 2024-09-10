$ErrorActionPreference = 'Stop'

$url32 = 'https://partner.pcloud.com/dl/win'
$url64 = 'https://partner.pcloud.com/dl/win64'
$checksum32  = '38d608c3a0c4ac1ae59397da3f8739cc13ebbf8dd94ce01cfc075eccd046414e'
$checksum64  = '3bcd93602d3cae8d6e4ab9c6d14a4ef3c89c2ed2a890e8b9f97c8bdefb20be6d'


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
