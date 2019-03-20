$ErrorActionPreference = 'Stop'

$packageName = 'vidcoder'
$url32       = 'https://github.com/RandomEngy/VidCoder/releases/download/v4.34/VidCoder-4.34.exe'
$checksum32  = '2F5B23D70F98B8B0B62A2A095FACD3F013F3DB6A474B05A2B74D326144F24EAB'

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
