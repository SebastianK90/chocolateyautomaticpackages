$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'paint.net.portable'
  FileFullPath   = Get-Item $toolsPath\*_x32.zip
  Destination    = $toolsPath
}

Get-ChildItem $toolsPath\* | Where-Object { $_.PSISContainer } | Remove-Item -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

$Shortcut = Get-ChildItem $toolsPath -Recurse -Include paintdotnet.exe | Select-Object -First 1
      
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Paint.Net.lnk" $Shortcut -WorkingDirectory "$toolsPath"

