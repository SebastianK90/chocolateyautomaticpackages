$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.6/Rambox-0.6.6-win-ia32.zip'
$url64       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.6/Rambox-0.6.6-win-x64.zip'
$checksum32  = 'f07c6176aac75380dac84049fa81c856fc6df722fe6d90a2667677b988a3bce3'
$checksum64  = 'cac764962d72b758502ba79b47f26fb83379d2c88745141905ae44b1bf786a5b'
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
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Rambox.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
