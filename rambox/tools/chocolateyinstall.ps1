$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.17/Rambox-0.5.17-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.17/Rambox-0.5.17-x64-win.zip'
$checksum32  = 'c2d739bdb048edf14dfb93dce1d0fac34afb19ac45b8db896a73c61077d5a95d'
$checksum64  = 'a2d58f3afe295f97c2a740087c9ee95b8e186bf946e6cf0b6591aa651074fadf'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

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

$FileFullPath = get-childitem $toolsPath -recurse -include Rambox.exe | select -First 1
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Rambox.lnk" $FileFullPath
