$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.9/Rambox-0.5.9-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.9/Rambox-0.5.9-x64-win.zip'
$checksum32  = '8893ccbf5e5c7490715451d215e290aac331472df77e3b3643e27a68dfa33dad'
$checksum64  = '8b3410309064a77843beb5a1ae6ceeb95e8eda9b193f68ef82153091ff9d7b31'
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
