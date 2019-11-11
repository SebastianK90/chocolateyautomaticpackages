$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'https://www.alcpu.com/CoreTemp/CoreTemp32.zip'
$url64       = 'https://www.alcpu.com/CoreTemp/CoreTemp64.zip'
$checksum32  = '0CAC1C1F548F0C3A35E707A50A5DB9B2D50639A6A0FB9B79A09D72B226DCD19D'
$checksum64  = '9A970958F7AB9B7DBA1C34D37C79CEFB10834C96E17F14C811FC03BE7A88C589'
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
