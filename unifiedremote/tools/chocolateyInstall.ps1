$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows'
$checksum32  = '862468f393b06070fae1d5a3b9a732a91004946d7fee7a6c63935f0b150cceb8'
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
Install-ChocolateyPackage @packageArgs -fileFullPath "$toolsPath\installer.exe"