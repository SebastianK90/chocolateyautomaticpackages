$ErrorActionPreference = 'Stop'
 
$packageName = 'gamesavemanager'
$url32       = 'https://www.gamesave-manager.com/?s=download&guid={C489235C-208E-4589-B35D-74DAC160CFED}&a=dl'
$checksum32  = 'DE439BA7F5DF178D52A025F317D357D25EC01CAA6BF2CB468F9A005C9433AEC5'
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