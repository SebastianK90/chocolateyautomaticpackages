$ErrorActionPreference = 'Stop'

$packageName = 'vidcoder'
$url32       = 'https://github.com/RandomEngy/VidCoder/releases/download/v4.35/VidCoder-4.35.exe'
$checksum32  = 'cd443aaee0778b5801f6bf9c45b5435fa21a9b4fd2d918f62c3f118dadc8768b'

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
