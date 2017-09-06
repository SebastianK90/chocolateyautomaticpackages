$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.11/Rambox-0.5.11-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.11/Rambox-0.5.11-x64-win.zip'
$checksum32  = '8cf00406927cfd25ca8ac47bb7b019412e3ea38807ab4774534898d551456e0d'
$checksum64  = '6ba8029011376945b230cd1ef886dcb9233e45aa07406019bca8483a66ef1f18'
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
