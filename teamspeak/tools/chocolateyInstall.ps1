$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.2.3/TeamSpeak3-Client-win32-3.2.3.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.2.3/TeamSpeak3-Client-win64-3.2.3.exe'
$checksum32  = 'd89420f771183244e7c1f65fb4628ec48e739a2ff9ad87e6d05891daa2d579ef'
$checksum64  = '64cdce5b680f8a310c969b6fb4046e43278d52300b1e69b19564f90ce79193ed'

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
