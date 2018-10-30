$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url32       = 'http://cemu.info/releases/cemu_1.14.0.zip'
$checksum32  = 'b82f0ca05cd453811996cc916a82c01e13d2d4a5f91d3753442b536749275ebd'
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

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" "$cemu_folder\cemu.exe" -WorkingDirectory "$cemu_folder" -RunAsAdmin
