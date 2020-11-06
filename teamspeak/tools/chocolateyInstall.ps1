$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.5.5/TeamSpeak3-Client-win32-3.5.5.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.5.5/TeamSpeak3-Client-win64-3.5.5.exe'
$checksum32  = '4ac8621566fb17175b2239acdbe687f3e543cdd742859fe919197831a4519f6d'
$checksum64  = 'b6e45a00d9a9edf04c47685ae6e741b80b71a333518b12212d39ec740c3fa399'

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
