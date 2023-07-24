$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.6.1/TeamSpeak3-Client-win32-3.6.1.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.6.1/TeamSpeak3-Client-win64-3.6.1.exe'
$checksum32  = '0a11252af7fbe2022386418539f9f1218f11c9834177e5580b4d77c7f9f131db'
$checksum64  = '3b6cf0a99f1686a53c3afc15e502593f50e3822a86dde400fee9ba38242c9532'

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
