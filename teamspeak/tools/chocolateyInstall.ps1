$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.5.0/TeamSpeak3-Client-win32-3.5.0.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.5.0/TeamSpeak3-Client-win64-3.5.0.exe'
$checksum32  = '9e3ea5b09fbbfd1ce49ae90021a3580fcc2a06bc5cee35b8802bbe4f76e2febd'
$checksum64  = '6712a84cc348c28a84b89881ed36501c0053e7793ba0b645dafdcfb510f20ee6'

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
