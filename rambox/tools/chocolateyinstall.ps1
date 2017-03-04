$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.7/Rambox-0.5.7-ia32-win.zip'
$url64       = 'https://github.com/saenzramiro/rambox/releases/download/0.5.7/Rambox-0.5.7-x64-win.zip'
$checksum32  = '5ad45ab558bc5894c2b78e784a6e4c6c66390f74a01e4a7db4e71419b78b59a4'
$checksum64  = 'f2aada1c564588c94831d055ff3c990f1e96d5ae934c89d4e575cbc457d4dcb4'
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
