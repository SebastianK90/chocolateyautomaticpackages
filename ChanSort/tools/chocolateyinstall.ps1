$ErrorActionPreference = 'Stop'

$packageName = 'ChanSort'
$url32       = 'https://github.com/PredatH0r/ChanSort/releases/download/v2017-06-10/ChanSort_2017-06-10.zip'
$checksum32  = '18dbafb5f26f6d2b9efcc34b6928a72a6fe24f7ecf312a41430b0aaae2541b51'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\ChanSort.lnk" $FileFullPath
