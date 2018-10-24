$ErrorActionPreference = 'Stop'

$packageName = 'occt.portable'
$url32       = 'http://www.ocbase.com/download/OCCTPT4.5.1.zip'
$checksum32  = 'B7E889A8214EB45DF4C5913BDA4C2EF856F01C0A93988B7EB64040E4421AAF56'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}


Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1


Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\OCCT.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
