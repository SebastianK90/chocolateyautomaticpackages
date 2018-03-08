$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.16/Rambox-0.5.16-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.16/Rambox-0.5.16-x64-win.zip'
$checksum32  = '1a58682f38225736e4874cd2c577369f81784d28c115724e8dac88a225aff29c'
$checksum64  = 'fee1f09ab297c6aa71d844f459a0effda65c84e41f39894ca1c42dc0124ed257'
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
