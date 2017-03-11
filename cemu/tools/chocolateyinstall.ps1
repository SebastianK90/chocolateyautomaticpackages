$ErrorActionPreference = 'Stop'

$packageName = 'cemu'
$url64       = 'http://cemu.info/releases/cemu_1.7.2.zip'
$checksum64  = 'c501fe59d2236bd5efdd9e1d3ec521efe0f89a68b5786dc5462ba9d089f47b83'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url64
  checksum       = $checksum64
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include Cemu.exe | sort {$_.CreationTime} | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CEMU.lnk" $FileFullPath
