$ErrorActionPreference = 'Stop'

$packageName = 'dispcalgui.portable'
$url32       = 'https://sourceforge.net/projects/dispcalgui/files/release/3.7.1.3/DisplayCAL-3.7.1.3-win32.zip/download'
$checksum32  = '404342398dbf2241301fafc59ac19dd07d65d55ee7de312b3967f2fd81ccd612'
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
