$ErrorActionPreference = 'Stop'

$url32 = 'https://partner.pcloud.com/dl/win'
$url64 = 'https://partner.pcloud.com/dl/win64'
$checksum32  = '3baa6ca50494cbf29686c48ff88f410acfdf307c2a5b959af28ce3bc16017553'
$checksum64  = 'ab17e13dd02549acb7e3f76695fb92cb4a9c21e65e059ac8c3daabbaf8930af0'


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
