$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.12/Rambox-0.5.12-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.12/Rambox-0.5.12-x64-win.zip'
$checksum32  = 'eb88d2659f49c322820617c77f74c81e12962d93fb1c2a4d9e8a8633f4ca9f8b'
$checksum64  = '55ad696b40b684ee031f225203977d54e8e75c972a678da9e7188a92dcb77abb'
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
