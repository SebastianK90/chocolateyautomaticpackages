$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.2.5/TeamSpeak3-Client-win32-3.2.5.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.2.5/TeamSpeak3-Client-win64-3.2.5.exe'
$checksum32  = 'abd6a3f3b66401a0a135640087b6bf6ee33a2315919db0e45dbf68708261944f'
$checksum64  = 'c84d98b9c24a2b3882f47cb38059bbf8c001db314fb59d40140bc99e104958d2'

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
