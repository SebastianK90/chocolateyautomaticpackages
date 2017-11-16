$ErrorActionPreference = 'Stop'

$packageName = 'ChanSort'
$url32       = 'https://github.com/PredatH0r/ChanSort/releases/download/v2017-11-16/ChanSort_2017-11-16.zip'
$checksum32  = 'e5360172506200bc88e2dcce7199de0ba1c5f5425d9e2523fc60aa8b345c99ef'
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
