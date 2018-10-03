$ErrorActionPreference = 'Stop'
 
$packageName = 'gamesavemanager'
$url32       = 'http://www.gamesave-manager.com/?s=download&a=dl'
$checksum32  = 'C0D503BB97F9D6D09C5FB710F3F152D0457F9DB49EA770F065C6C695F84486D4'
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
