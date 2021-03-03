$ErrorActionPreference = 'Stop'
 
$packageName = 'syspin'
$url32       = 'http://www.technosys.net/download.aspx?file=syspin.exe'
$checksum32  = '07D6C3A19A8E3E243E9545A41DD30A9EE1E9AD79CDD6D446C229D689E5AB574A'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  FileFullPath  = "$toolsPath\syspin.exe"
}

Get-ChocolateyWebFile @packageArgs -GetOriginalFileName
