$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'paint.net.portable'
  FileFullPath   = "$toolsPath\paint.net.5.0.6.portable.x64_x64.zip"
  Destination    = "C:\tools\paint.net.portable\"
}

Get-ChocolateyUnzip @packageArgs

$Shortcut = Get-ChildItem $packageArgs['Destination'] -Recurse -Include paintdotnet.exe | Select-Object -First 1
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Paint.Net.lnk" $Shortcut -WorkingDirectory $packageArgs['Destination']
