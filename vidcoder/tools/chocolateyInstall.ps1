$ErrorActionPreference = 'Stop'

$packageName = 'vidcoder'
$url32       = 'https://github.com/RandomEngy/VidCoder/releases/download/v3.16/VidCoder-3.16.exe'
$checksum32  = 'b3ded05a1542c9aef4e74501b9e9c077cee9ae34c1c0513729988093ce3725f3'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs