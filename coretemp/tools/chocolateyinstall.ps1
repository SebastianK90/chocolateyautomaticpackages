$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=2'
$url64       = 'http://www.alcpu.com/CoreTemp/php/download.php?id=3'
$checksum32  = 'd10a793ad45eda7726663cb580716a1cdbf29913da3ca4fb3371712f4912a53a'
$checksum64  = '997815238d03a5161ad83afe06499dcd0c0dfd614eb4b424f6fc2f80a5706d48'
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
