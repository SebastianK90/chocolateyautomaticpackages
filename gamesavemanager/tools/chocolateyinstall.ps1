$ErrorActionPreference = 'Stop'
 
$packageName = 'gamesavemanager'
$url32       = 'http://www.gamesave-manager.com/?s=download&a=dl'
$checksum32  = '3eab17ff9c21a938856d2a528ef94fb8cc7c08e3a4f23efcefc51cb9e1691c0c'
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
