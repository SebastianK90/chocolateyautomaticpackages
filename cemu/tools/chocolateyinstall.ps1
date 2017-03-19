$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url64       = 'http://cemu.info/releases/cemu_1.7.3.zip'
$checksum64  = '45f033915a293a2dcf8693a91a280fc151fd3231a2ad94b0ef06cda6ec84731b'
$toolsPath   =  (Split-Path $MyInvocation.MyCommand.Definition)
$cemu_folder = "$toolsPath\cemu"
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition


$packageArgs = @{
  packageName    = $packageName
  url64            = $url64
  checksum64       = $checksum64
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

$latest = (Get-ChildItem $toolsPath -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -like '*cemu_*'} | sort {$_.CreationTime} | select -First 1).FullName

Robocopy $latest $cemu_folder /R:0 /W:0 /E /XO

Remove-Item $latest -Recurse -Force -ErrorAction SilentlyContinue

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" "$cemu_folder\cemu.exe"