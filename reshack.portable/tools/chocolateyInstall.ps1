$ErrorActionPreference = 'Stop'

$packageName = 'reshack.portable'
$url32       = 'http://www.angusj.com/resourcehacker/resource_hacker.zip'
$checksum32  = '7d33dbc5ab0e4a9e1c88471d8afcba024dc62792f643833869f4e459306b01e6'
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
