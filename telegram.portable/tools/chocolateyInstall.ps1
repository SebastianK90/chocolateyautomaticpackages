$ErrorActionPreference = 'Stop'

$packageName = 'telegram.portable'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.6.0/tportable.1.6.0.zip'
$checksum32 = '51bb769c63471c59ba027e54cea14b894ed3519810c261b2c1fc26ffb5f1e83c'
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
