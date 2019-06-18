$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.3.0/TeamSpeak3-Client-win32-3.3.0.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.3.0/TeamSpeak3-Client-win64-3.3.0.exe'
$checksum32  = '0ef541ca846b2c0f68b5e7249387c83fe17bce95000062bd6dbd3f73fbad2d1b'
$checksum64  = '0d0d5e29761d9c1f58e7e976d516f3e16ef8680d2a2c62a337d9661a26382230'

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
