$ErrorActionPreference = 'Stop'
 
$packageName = 'occt'
$url32       = 'https://www.ocbase.com/download/edition:Personal'
$checksum32  = 'd332e9194596fff867085cb08f13d6e59d5c9b9eeebb91e1432cf526c8e66824'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)

 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  FileFullPath  = "$toolsPath\occt.exe"
}

Get-ChocolateyWebFile @packageArgs
 
$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
      
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\OCCT.lnk" $FileFullPath -WorkingDirectory "$toolsPath" -RunAsAdmin
