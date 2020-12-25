$ErrorActionPreference = 'Stop'
 
$packageName = 'occt'
$url32       = 'https://www.ocbase.com/download'
$checksum32  = 'a5ac1c0c320bf45dcf986e45984cfa51ad1465e668e15a3b21f0f4436549dff5'
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
