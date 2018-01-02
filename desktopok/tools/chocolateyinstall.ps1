$ErrorActionPreference = 'Stop'

$packageName = 'desktopok'
$url32       = 'http://www.softwareok.com/Download/DesktopOK.zip'
$url64       = 'http://www.softwareok.com/Download/DesktopOK_x64.zip'
$checksum32  = 'bd21b138fad69b7ea04b0a8c1a1e99de55fa764cc8bf7a7b3c34662baf8403ef'
$checksum64  = '9bfd6b74a54a390e85d764c283e9a00c623221dab7679ce51930e46160ca4572'
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
