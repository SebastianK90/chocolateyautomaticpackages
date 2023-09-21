$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.6.2/TeamSpeak3-Client-win32-3.6.2.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.6.2/TeamSpeak3-Client-win64-3.6.2.exe'
$checksum32  = 'd4614867851d6d0e90dc0709eccefcf966a42b231fb55e6abe446d9a2d8cc657'
$checksum64  = 'eab9e0c1a7134643e5f7116b7e0e58faffb20d6db528f8b333d2c2b5d1ab68ae'

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
