$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=2'
$url64       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=3'
$checksum32  = 'd775a5a5f5c55d78688c5fb462cec5304c0048ecb006c2a3c46d9ccd09644d19'
$checksum64  = '73c07ec8e42739ddbd70eb8e152572c64e551c69939dd2c1b54abfa235449136'
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
