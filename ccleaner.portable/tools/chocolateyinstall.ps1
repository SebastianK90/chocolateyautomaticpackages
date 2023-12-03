﻿$ErrorActionPreference = 'Stop'

$packageName = 'ccleaner.portable'
$url32       = 'https://download.ccleaner.com/portable/ccsetup618.zip'
$checksum32  = 'e1b5f1df474396a601884f344f0a06fd2e87511d7fa46b05747a83f4536a5fef'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$bits = Get-ProcessorBits
$ccleaner_temp = "$env:USERPROFILE\ccleaner_temp"

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}


Install-ChocolateyZipPackage @packageArgs

if($bits -ne 64)
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include 'CCleaner.exe' | select -First 1
    }
else
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include 'CCleaner64.exe' | select -First 1
    }

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CCleaner.lnk" $FileFullPath -WorkingDirectory "$toolsPath"

if(Test-Path $ccleaner_temp) {
    Move-Item (Get-ChildItem $ccleaner_temp) -Destination $toolsPath -Force
}