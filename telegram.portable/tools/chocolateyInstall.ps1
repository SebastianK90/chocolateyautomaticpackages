$ErrorActionPreference = 'Stop'

$packageName = 'telegram.portable'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.5.8/tportable.1.5.8.zip'
$checksum32 = 'f6e5525bd3a27ced44c05bfbc581042411ffea96a1952a77c5afa5ac51987d8e'
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
     
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Telegram.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
