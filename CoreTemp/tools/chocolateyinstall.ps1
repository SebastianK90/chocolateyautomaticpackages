$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=2'
$url64       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=3'
$checksum32  = 'bf10b293f881c21c1c40056f285d91b37a402f260d40d841edf89a0f09f1822e'
$checksum64  = 'ff0a07c68d04ca19daf79483f900868609fd8df97d3b3c70450df8e71eacc74d'
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
