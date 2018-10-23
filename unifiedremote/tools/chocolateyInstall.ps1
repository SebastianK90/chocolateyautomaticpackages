$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows-setup'
$checksum32  = '477292CC343800BAC042E854EECF0A7EE65E3575CF581D40E83A272128031306'
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

Start-Process autohotkey.exe -ArgumentList "$toolsPath\install.ahk" -PassThru
Install-ChocolateyPackage @packageArgs