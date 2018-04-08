$ErrorActionPreference = 'Stop'

$packageName = 'desktopok'
$url32       = 'http://www.softwareok.com/Download/DesktopOK.zip'
$url64       = 'http://www.softwareok.com/Download/DesktopOK_x64.zip'
$checksum32  = '0ee0ccd209b6bd2895745a09d1641574961e3ebb652567d79cd709504806435e'
$checksum64  = '7cc1a4631b630e10f606c7ef93a02335a67cc96e8815d2821a9d0835c7f144e0'
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
