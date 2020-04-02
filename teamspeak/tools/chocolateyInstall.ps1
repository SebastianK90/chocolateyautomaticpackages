$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.5.2/TeamSpeak3-Client-win32-3.5.2.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.5.2/TeamSpeak3-Client-win64-3.5.2.exe'
$checksum32  = '4ac7f746be2cac47985388ec97d6b01e50c4236457b6a07b888fd3d050cafb41'
$checksum64  = '09d3b1cbc359a0a1ae9e2307d5a861682a4f8f5acb81601a908b1cb3cc75febe'

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
