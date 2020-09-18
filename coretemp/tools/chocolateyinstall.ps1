$ErrorActionPreference = 'Stop'

$packageName = 'coretemp'
$url32       = 'https://www.alcpu.com/CoreTemp/CoreTemp32.zip'
$url64       = 'https://www.alcpu.com/CoreTemp/CoreTemp64.zip'
$checksum32  = '5F4609203338BA6439B59529295D5D449BC53581EEAC28678F9B47596E3C094A'
$checksum64  = 'B7921D20C2387AA7EB7A5A25A33CD045024CCE996D05378165BE48C267B68150'
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