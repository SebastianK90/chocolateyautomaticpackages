$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.portable'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.8.0.0/DisplayCAL-3.8.0.0-win32.zip/download'
$checksum32  = '65a58be3b36340cf3edda3334f35cb0e4c17cd05047f83a6655886b06af41152'
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
