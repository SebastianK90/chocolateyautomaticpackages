$ErrorActionPreference = 'Stop'
 
$packageName = 'occt'
$url32       = 'https://www.ocbase.com/download/edition:Personal'
$checksum32  = '542bd385029e80d596f600971b7a24d4aebe33ea9a9b27b3a9df367f66ae04c8'
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
