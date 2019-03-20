$ErrorActionPreference = 'Stop'

$packageName = 'telegram.portable'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.6.1/tportable.1.6.1.zip'
$checksum32 = 'bf2ff65bcc901622182c076e21be7c5e007eb7a879dca044e65ad59990851e35'
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
