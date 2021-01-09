$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows'
$checksum32  = '185920BA51752AEF95137F5B9C6C1BDDAF4CE3184A78A498567C791FB78EE7B6'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/Verysilent'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Start-Process autohotkey.exe -ArgumentList "$toolsPath\install.ahk"
Install-ChocolateyPackage @packageArgs