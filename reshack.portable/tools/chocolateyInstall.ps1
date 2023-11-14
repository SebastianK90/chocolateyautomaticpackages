$ErrorActionPreference = 'Stop'

$packageName = 'reshack.portable'
$url32       = 'http://www.angusj.com/resourcehacker/resource_hacker.zip'
$checksum32  = 'd9a1be588f1b5354d62ee545487665c51c8d50e051cfb445c52b2a9e18fee036'
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
     
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Resource Hacker™.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
