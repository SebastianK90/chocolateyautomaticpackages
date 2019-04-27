$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'ecm'
  FileFullPath   = Get-Item $toolsPath\*_x32.zip
  Destination    = $toolsPath
}

Get-ChildItem $toolsPath\* | Where-Object { $_.PSISContainer } | Remove-Item -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

$Shortcut = Get-ChildItem $toolsPath -Recurse -Filter "EcMenu*" -Include *.exe | select -First 2
     

$bits = Get-ProcessorBits
if ($bits -eq 64)
{
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Easy Context Menu.lnk" $Shortcut[1] -WorkingDirectory "$toolsPath"}
else
{
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Easy Context Menu.lnk" $Shortcut[0] -WorkingDirectory "$toolsPath"}
