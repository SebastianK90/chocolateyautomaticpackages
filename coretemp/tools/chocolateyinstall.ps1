$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'https://www.alcpu.com/CoreTemp/CoreTemp64.zip'
$url64       = 'https://www.alcpu.com/CoreTemp/CoreTemp32.zip'
$checksum32  = 'e82ac0b3fb404bc4542efba8329e8bfeb43403e76ffed67f5efa704ad31ad863'
$checksum64  = '3b181f766aa1a1ea9ced8aacb24a8a6342a3bf89a2714a2422cc924a23d18a16'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Core Temp.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
