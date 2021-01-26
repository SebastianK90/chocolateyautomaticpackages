$ErrorActionPreference = 'Stop'
 
$packageName = 'occt'
$url32       = 'https://www.ocbase.com/download'
$checksum32  = '649483492efadd063dbbf403d1b1691416d0f992615e1bf0d75aba03df787069'
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
