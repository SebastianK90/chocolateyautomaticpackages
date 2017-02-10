$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url64       = 'http://cemu.info/releases/cemu_1.7.1.zip'
$checksum64  = '181fbe6239cd7366b7576cd574203dbe5fa29363b79943abcf609c47c24c359c'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url64
  checksum       = $checksum64
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" $FileFullPath
