$packageName = 'teamspeak'
$url32 = 'https://files.teamspeak-services.com/releases/client/3.3.2/TeamSpeak3-Client-win32-3.3.2.exe'
$url64 = 'https://files.teamspeak-services.com/releases/client/3.3.2/TeamSpeak3-Client-win64-3.3.2.exe'
$checksum32  = '263ea40e29c2e67d708bd0e91d8aafff57036ea59371890b0c5dd6e7190441df'
$checksum64  = 'acdd484629a3c4a140ae5963abc673f83ed2ea6f545cbebdadbd1b66bde6b02d'

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
