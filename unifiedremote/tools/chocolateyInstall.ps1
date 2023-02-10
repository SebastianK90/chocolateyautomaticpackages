$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows'
$checksum32  = 'e084d1a666d9bbfdc7bdc2be24e09b9b93edcf6ab14586a3aab74e74bd87a37d'
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
