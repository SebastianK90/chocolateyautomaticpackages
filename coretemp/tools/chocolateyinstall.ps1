$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'https://www.alcpu.com/CoreTemp/CoreTemp32.zip'
$url64       = 'https://www.alcpu.com/CoreTemp/CoreTemp64.zip'
$checksum32  = '06016eb81fcbd6e57b07fe01cef48d004335df7397e1153f7e8ab0896d559dfa'
$checksum64  = 'cbd804d84cb0ba3d4e738dc510bbf5448024fdb005627fb81e757ca5054e05bb'
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
