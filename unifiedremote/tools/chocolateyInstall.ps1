$ErrorActionPreference = 'Stop'
 
$packageName = 'unifiedremote'
$url32       = 'https://www.unifiedremote.com/download/windows'
$checksum32  = '1D12D0E124431A70BADF5AA02EB7AE340AC6C7D4324ADA6AEF591DFE4E1A7514'
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