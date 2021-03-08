$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows'
$checksum32  = '239ccdebb1305460a7f4817fe0c74595acd3a99b55c29e4570f90e99f4e4262d'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/Verysilent /Norestart'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

certutil -addstore "TrustedPublisher" "$toolsPath\cert.cer"
Install-ChocolateyPackage @packageArgs
