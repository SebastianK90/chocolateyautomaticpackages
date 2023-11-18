$ErrorActionPreference = 'Stop'

$packageName = 'reshack.portable'
$url32       = 'http://www.angusj.com/resourcehacker/resource_hacker.zip'
$checksum32  = '971e2f0f8e0414e66e7283e8da4dc8fa91ef4a3bceb20bcedefc7014b499fdc0'
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
