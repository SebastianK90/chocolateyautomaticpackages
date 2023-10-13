$ErrorActionPreference = 'Stop'

$url32 = 'https://partner.pcloud.com/dl/win'
$url64 = 'https://partner.pcloud.com/dl/win64'
$checksum32  = 'A0F4A0E3851771D7FCD64F4204DFFE24A21C2D2C3A496EAE08F98C2F511746F2'
$checksum64  = '346468AC3FEE9F2577874A3AF7323D2A9785E9F5D2FE028C042026DBE3092B72'


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
