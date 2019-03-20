$ErrorActionPreference = 'Stop'

$packageName = 'vidcoder'
$url32       = 'https://github.com/RandomEngy/VidCoder/releases/download/v4.34/VidCoder-4.34-Portable.exe'
$checksum32  = '2dab24123702a89fef482fbe9e433059f7ee811317f71e5ab9385eec614f9a57'

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
