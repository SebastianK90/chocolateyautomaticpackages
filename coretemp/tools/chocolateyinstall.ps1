$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=2'
$url64       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=3'
$checksum32  = '39c003634cce5d73604452e1b9213e5928f368df06f73508d3fb60bf06198991'
$checksum64  = 'd473672f8acddb3481bb36e1616112ee2e405223d446b6cbc179f36706623102'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Core Temp.lnk" $FileFullPath
