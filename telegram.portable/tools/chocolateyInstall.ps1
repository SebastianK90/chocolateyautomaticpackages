﻿$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'telegram.portable'
  FileFullPath   = Get-Item $toolsPath\tportable*_x32.zip
  FileFullPath64 = Get-Item $toolsPath\tportable-x64*_x64.zip
  Destination    = "C:\tools\telegram.portable"
}

Get-ChocolateyUnzip @packageArgs

$Shortcut = Get-ChildItem $packageArgs['Destination'] -Recurse -Include Telegram.exe| Select-Object -First 1
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Telegram.lnk" $Shortcut -WorkingDirectory $packageArgs['Destination']
