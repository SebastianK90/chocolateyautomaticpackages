$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url64       = 'http://cemu.info/releases/cemu_1.7.3.zip'
$checksum64  = '45f033915a293a2dcf8693a91a280fc151fd3231a2ad94b0ef06cda6ec84731b'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url64
  checksum       = $checksum64
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include Cemu.exe | sort {$_.CreationTime} | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" $FileFullPath
