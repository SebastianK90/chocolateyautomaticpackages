$ErrorActionPreference = 'Stop'

$packageName = 'desktopok'
$url32       = 'http://www.softwareok.com/Download/DesktopOK.zip'
$url64       = 'http://www.softwareok.com/Download/DesktopOK_x64.zip'
$checksum32  = '121b58308eeb083dd9b11dc70e70f65f0c5c4be2d710e6904a20c68302d6b1bf'
$checksum64  = '9b5c964202dd69be52c3677ff2896dd2f64a91ae9d2aed6d61bcbd094939037c'
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
