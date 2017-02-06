$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.3/Rambox-0.5.3-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.3/Rambox-0.5.3-win-x64.zip'
$checksum32  = 'b5d7fdeb0a39abe60e7d64ae056e58165a04f98c22dde1d4ee56139fb2c76ee0'
$checksum64  = 'efdd41f544ed3eca7e9402785849efd20c9f7f9b9c09db10b2ef4b0ac1335e6c'
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
