$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url32       = 'http://cemu.info/releases/cemu_1.11.6.zip'
$checksum32  = '9fecf9ace3328d9c4dba3ef0919fdcc1e8624dd1eeb94228f3c0628cbd0ea6f5'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$cemu_folder = "$toolsPath\cemu"

$packageArgs = @{
  packageName    = $packageName
  url          = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

$latest = (Get-ChildItem $toolsPath -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -like '*cemu*'} | sort {$_.CreationTime} | select -First 1).FullName

Robocopy $latest $cemu_folder /R:0 /W:0 /E /XO

Remove-Item $latest -Recurse -Force -ErrorAction SilentlyContinue

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" "$cemu_folder\cemu.exe"
