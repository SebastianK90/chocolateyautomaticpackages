$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'paint.net.portable'
  FileFullPath   = "$toolsPath\paint.net.5.0.1.portable.x64_x64.zip"
  Destination    = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

$Shortcut = Get-ChildItem $toolsPath -Recurse -Include paintdotnet.exe | Select-Object -First 1
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Paint.Net.lnk" $Shortcut -WorkingDirectory "$toolsPath"

