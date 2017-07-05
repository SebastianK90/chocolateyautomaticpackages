$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.10/Rambox-0.5.10-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.10/Rambox-0.5.10-x64-win.zip'
$checksum32  = '910b78b3173b6b8cb0dbec4ceaf75eb2ccbe332d2a0e6ddd62a6740ecb5649cd'
$checksum64  = 'fba04deb3904e8d04202cbb4b4e725715eb5426d4f32a920ad0b62749feef4e7'
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
