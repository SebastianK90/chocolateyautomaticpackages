$ErrorActionPreference = 'Stop'

$PackageName    = 'cemu'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$cemu_folder = "$(Get-ToolsLocation)\cemu"

$packageArgs = @{
  packageName    = $packageName
  FileFullPath   = Get-Item $toolsPath\*_x32.zip
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}


$move_folder_bkp = (Get-ChildItem "$env:ChocolateyInstall\lib-bkp\cemu\tools\" -Filter 'Cemu_*' -ErrorAction SilentlyContinue).FullName
$move_folder = (Get-ChildItem "$env:ChocolateyInstall\lib\cemu\tools\" -Filter 'Cemu_*' -ErrorAction SilentlyContinue).FullName

If (Get-Item "$move_folder_bkp\Cemu.exe" -ErrorAction SilentlyContinue) {
	Write-Output "Migrating cemu location to $cemu_folder"
	Move-Item $move_folder_bkp "$(Get-ToolsLocation)" -Force
	Remove-Item $move_folder -Recurse -Force -ErrorAction SilentlyContinue
}


Install-ChocolateyZipPackage @packageArgs

$latest = (Get-ChildItem $toolsPath -Recurse -Directory -ErrorAction SilentlyContinue | Where-Object {($_.Name -like '*cemu*') -or ($_.Name -like 'Cemu_*')} | sort {$_.CreationTime} | select -First 1).FullName
Robocopy "$latest" "$cemu_folder" /R:0 /W:0 /E /XO
Remove-Item "$latest" -Recurse -Force -ErrorAction SilentlyContinue

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" "$cemu_folder\cemu.exe" -WorkingDirectory "$cemu_folder"

