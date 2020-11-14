$ErrorActionPreference = 'Stop'

$packageName = 'reshack.portable'
$url32       = 'http://www.angusj.com/resourcehacker/resource_hacker.zip'
$checksum32  = 'c5a0e7f4b8f1089418520562c13d45f8e6fcfff65537830fb166f218b095708c'
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
