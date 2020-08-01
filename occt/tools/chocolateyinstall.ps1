$ErrorActionPreference = 'Stop'
 
$packageName = 'occt'
$url32       = 'https://www.ocbase.com/download'
$checksum32  = '731c9e963ea7c0fe84f4ad4020a621acfc86c8db3635ddb4bb88365fd7fe04e0'
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
