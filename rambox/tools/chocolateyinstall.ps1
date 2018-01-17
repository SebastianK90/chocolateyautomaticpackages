$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.15/Rambox-0.5.14-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.15/Rambox-0.5.14-x64-win.zip'
$checksum32  = '0ef3a3e16421866d9ec150d5a30ae8fd29e0d40388af49aa19292d99a178f1ff'
$checksum64  = 'efa74ed29e38002dea4e60e96c150ac703666e3df31e48a5cbc4b551b354c874'
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
