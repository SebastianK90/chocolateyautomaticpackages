$ErrorActionPreference = 'Stop'
 
$packageName = 'gamesavemanager'
$url32       = 'http://www.gamesave-manager.com/?s=download&a=dl'
$checksum32  = 'F46DD0A491A8B327C5C160AFB42925567A110B6456CECACFB0816A756E2DA92A'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs
 
$FileFullPath = get-childitem $toolsPath -Recurse -Filter "gs_mngr*" -include *.exe | select -First 1
   
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\GameSave Manager 3.lnk" $FileFullPath
