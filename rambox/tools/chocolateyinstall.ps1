$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.13/Rambox-0.5.13-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.13/Rambox-0.5.13-x64-win.zip'
$checksum32  = '28d502d8801e439399a7669e159aa56516227b398bccb5514b630b0ad76d2212'
$checksum64  = '57a4a36b46336578f3eed9c7b8ad62e950bfa2d1ea3a6d63c5122e1926fc9456'
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
