$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url64       = 'http://cemu.info/releases/cemu_1.6.3.zip'
$checksum64  = 'cb35b2da7e04343c969a8d5948561258959f1fe782685988a557ed67b560ca7a'
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
