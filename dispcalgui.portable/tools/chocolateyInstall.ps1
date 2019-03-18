$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.portable'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.2.0/DisplayCAL-3.7.2.0-win32.zip/download'
$checksum32  = 'e0a60419c1776928e220ff83a793fd81d76fad467677a9d254426d47a1d98fa9'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include DisplayCAL.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\DisplayCAL.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
