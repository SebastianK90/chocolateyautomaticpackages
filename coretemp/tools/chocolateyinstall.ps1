$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=2'
$url64       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=3'
$checksum32  = '1a4db08f1a0f5afc326988348d88b54eec448439109232c446b5af56dffacf1d'
$checksum64  = 'f9c277344ab41c876d0c5f297f139104ae955cc51a3eae746460633e553f2e55'
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
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Core Temp.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
