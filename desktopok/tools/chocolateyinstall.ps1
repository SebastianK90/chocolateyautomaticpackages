$ErrorActionPreference = 'Stop'

$packageName = 'desktopok'
$url32       = 'http://www.softwareok.com/Download/DesktopOK.zip'
$url64       = 'http://www.softwareok.com/Download/DesktopOK_x64.zip'
$checksum32  = '5eebfc2690e2c0e6f65362b50c31fbe0582f63ae984e0c355a0bf010e8719587'
$checksum64  = '81228ae3f5061d3b0e797265ee38e4531f555862e6cb9acefca51311c73a29e9'
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
