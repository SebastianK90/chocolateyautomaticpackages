$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url32       = 'https://cemu.info/releases/cemu_1.22.4.zip'
$checksum32  = '53619a10ba8bf3d97d3ff20003878c1ce025523f981d416101e7091a2fc9b2c4'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$cemu_folder = "$(Get-ToolsLocation)\cemu"

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

If (Get-Item "$env:ChocolateyInstall\lib-bkp\cemu\tools\cemu\Cemu.exe" -ErrorAction SilentlyContinue) {
	Write-Output "Migrating cemu location to $cemu_folder"
	Move-Item "$env:ChocolateyInstall\lib-bkp\cemu\tools\cemu" "$(Get-ToolsLocation)" -Force
	Remove-Item "$env:ChocolateyInstall\lib\cemu\tools\cemu" -Recurse -Force -ErrorAction SilentlyContinue
}

Install-ChocolateyZipPackage @packageArgs

$latest = (Get-ChildItem $toolsPath -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -like '*cemu*'} | sort {$_.CreationTime} | select -First 1).FullName
Robocopy "$latest" "$cemu_folder" /R:0 /W:0 /E /XO
Remove-Item "$latest" -Recurse -Force -ErrorAction SilentlyContinue

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" "$cemu_folder\cemu.exe" -WorkingDirectory "$cemu_folder"

