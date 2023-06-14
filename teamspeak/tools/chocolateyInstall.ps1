$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.6.0/TeamSpeak3-Client-win32-3.6.0.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.6.0/TeamSpeak3-Client-win64-3.6.0.exe'
$checksum32  = '1fe9d240f94893f63fd61e3270c5ac23dcbcedb2a6eb840211e4aee7135a8ab0'
$checksum64  = '2752de74add856b8c8e0db9fedd2c2e12fa5c47226feca4e37135c4680f62ac3'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S'
}

New-Item "$env:temp\overwolfdummy" -ItemType Directory -Force

Install-ChocolateyPackage @packageArgs
