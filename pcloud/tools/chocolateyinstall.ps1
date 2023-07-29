$ErrorActionPreference = 'Stop'

$url32 = 'https://partner.pcloud.com/dl/win'
$url64 = 'https://partner.pcloud.com/dl/win64'
$checksum32  = '6a9941497b8fe1d8cc547173bc74ed95959854d0f6f5a32d8a1491628e767e93'
$checksum64  = '29e97cff346428774837a04e3e281060ae7110a3fab471d249977bf6e14399f6'


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
