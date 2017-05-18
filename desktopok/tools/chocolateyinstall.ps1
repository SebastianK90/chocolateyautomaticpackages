$ErrorActionPreference = 'Stop'

$packageName = 'desktopok'
$url32       = 'http://www.softwareok.com/Download/DesktopOK.zip'
$url64       = 'http://www.softwareok.com/Download/DesktopOK_x64.zip'
$checksum32  = 'ce9f4016d058c802417813617d708f1f400201e26db252dbf988ff1f034a613c'
$checksum64  = 'e2e4581ec1a4f599b73c4ada9fe4fecdbd60fac334e476afc4375f90ae8e8fde'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

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
     
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\DesktopOK.lnk" $FileFullPath
