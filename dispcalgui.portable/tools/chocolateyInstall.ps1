$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.portable'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.1.4/DisplayCAL-3.7.1.4-win32.zip/download'
$checksum32  = 'a2b3d547fc0c11b8f739a070eb96b6845897b4ccda8958f04e2c53e1196cbe05'
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
