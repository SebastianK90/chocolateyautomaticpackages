$ErrorActionPreference = 'Stop'
 
$packageName = 'gamesavemanager'
$url32       = 'http://www.gamesave-manager.com/?s=download&a=dl'
$checksum32  = 'eee10523c7a856e60639181a3f830cc1d2c3bb9a9fb26dc1641f5f84eb26ebed'
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
   
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\GameSave Manager 3.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
