$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.3.1/TeamSpeak3-Client-win32-3.3.1.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.3.1/TeamSpeak3-Client-win64-3.3.1.exe'
$checksum32  = '9960753c711e47c9b94da40c67cb8fbd74ce3137d0426b34ace26d8e48980091'
$checksum64  = '3af5f4ad5ebc8e32a7fce48b73442182695a479247280746c7ffdcf029b3dcac'

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
