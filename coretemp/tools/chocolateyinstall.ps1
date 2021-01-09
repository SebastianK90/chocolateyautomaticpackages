$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'https://www.alcpu.com/CoreTemp/CoreTemp32.zip'
$url64       = 'https://www.alcpu.com/CoreTemp/CoreTemp64.zip'
$checksum32  = '9699461D8F7320A118C1FD3126C29C9DFA5B46505466FB7C38084BC79B69E5CD'
$checksum64  = 'BEF4A9037F3241C555F132476C34348294EFF04D7D40DC9A29A8876F6168762A'
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
