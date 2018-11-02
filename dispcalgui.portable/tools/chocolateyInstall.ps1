$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.portable'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.1.0/DisplayCAL-3.7.1.0-win32.zip/download'
$checksum32  = '60f80a2e95da8e700b5d33c44abd53ba38e0bd662882def8d42ac3b8efd4ab6d'
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
