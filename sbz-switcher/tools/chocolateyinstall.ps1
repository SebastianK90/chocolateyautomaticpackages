$ErrorActionPreference = 'Stop'

$packageName = 'sbz-switcher'
$url32       = 'https://sourceforge.net/projects/sbzswitcher/files/Release/SBZSwitcher_v1.9.6.7z/download'
$checksum32  = '0bff55ca36334aeb9939090706ed60739dc1945c90e9d59bcb115e748718ea48'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include SBZSwitcher.exe | select -First 1
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\SBZ Switcher.lnk" $FileFullPath
