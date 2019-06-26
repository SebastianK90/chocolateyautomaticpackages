$ErrorActionPreference = 'Stop'
 
$packageName = 'gamesavemanager'
$url32       = 'http://www.gamesave-manager.com/?s=download&a=dl'
$checksum32  = '1B97AD3DA6FD14B04F1037AE6FE15FD69AEDEF00ECCC6B85FBCF7C0B5AD77EA8'
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
