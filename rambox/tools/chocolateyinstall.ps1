$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.1/Rambox-0.6.1-win-ia32.zip'
$url64       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.1/Rambox-0.6.1-win-x64.zip'
$checksum32  = 'afbe0a02042f63b5d3222157775ed26e6ef4d9ab4d3f5a5c9a641fdb5d94e208'
$checksum64  = 'a7e8099621f4bbd01a4952fa1de1cc884c7b5bbecd29cd01bf2dd4dd45a418d0'
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
