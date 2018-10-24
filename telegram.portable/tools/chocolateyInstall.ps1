$ErrorActionPreference = 'Stop'

$packageName = 'telegram.portable'
$url32 = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.4.4/tportable.1.4.4.beta.zip'
$checksum32 = 'cb04012551bec3c8dec0f1ddb43b5104ea4969207576e53012bee0eca2e1d622'
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
