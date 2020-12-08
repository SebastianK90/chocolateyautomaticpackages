$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.5.6/TeamSpeak3-Client-win32-3.5.6.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.5.6/TeamSpeak3-Client-win64-3.5.6.exe'
$checksum32  = 'c1387e7dd8be6ddeb23d235fad04f207b5c81b0a71e9e5acba1c6ce856414142'
$checksum64  = '86381879a3e7dc7a2e90e4da1cccfbd2e5359b7ce6dd8bc11196d18dfc9e2abc'

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
