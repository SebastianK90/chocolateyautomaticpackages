$ErrorActionPreference = 'Stop'

$packageName = 'desktopok'
$url32       = 'https://www.softwareok.com/Download/DesktopOK.zip'
$url64       = 'https://www.softwareok.com/Download/DesktopOK_x64.zip'
$checksum32  = 'eb3aea04f0ed204472f1c93096e8d3dec8b1e5fa197085741993179044258ed8'
$checksum64  = '18cbd54368d14fb0aa5433ca7fd56cac4b0913206fd2343ec92216407a642a06'
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
     
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\DesktopOK.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
