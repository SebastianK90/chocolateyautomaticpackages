$ErrorActionPreference = 'Stop'

$packageName = 'reshack.portable'
$url32       = 'http://www.angusj.com/resourcehacker/resource_hacker.zip'
$checksum32  = 'd158bebc2993cf6bebf2c23a93572a68544c2ba5ae056538f70a58075c9392d6'
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
