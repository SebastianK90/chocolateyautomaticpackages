$ErrorActionPreference = 'Stop'
 
$packageName = 'syspin'
$url32       = 'http://www.technosys.net/download.aspx?file=syspin.exe'
$checksum32  = 'ad3be60154059f74a6b63941479cc4b8582ad742ea4dcf307d9612ad7fadbb8d'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  FileFullPath  = "$toolsPath\syspin.exe"
}

Get-ChocolateyWebFile @packageArgs -GetOriginalFileName
