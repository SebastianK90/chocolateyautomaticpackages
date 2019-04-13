$ErrorActionPreference = 'Stop'

$packageName = 'telegram.portable'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.6.7/tportable.1.6.7.zip'
$checksum32 = 'bbe6e946a46750d411bb54adaed0330836b2b5e829c2cf58c001120e36318c6a'
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
