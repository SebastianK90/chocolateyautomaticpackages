$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.8/Rambox-0.5.8-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.8/Rambox-0.5.8-x64-win.zip'
$checksum32  = '1e6cf613db29c3fe4ae82ae0860d12e116eca52aaf68392fb96ef1c369d93c2a'
$checksum64  = 'f6a32872f4df72b99f19b439cf5cb3a11c1f05736b737ab39d20f46800601871'
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
