$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.2/Rambox-0.6.2-win-ia32.zip'
$url64       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.2/Rambox-0.6.2-win-x64.zip'
$checksum32  = '45df3df8590fd6397a57f116c0776398d4be09f09d902002522387e5f93c71d8'
$checksum64  = '30d029f58a74189e523c8c3a1c7229fe2d1279d27e37c06c22e0b09295f482b5'
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
