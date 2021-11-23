$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows'
$checksum32  = '6fe9b9e8a32e81b40a00b36adea705d766aab7fa7eb6018e79ac07a327af695e'
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
