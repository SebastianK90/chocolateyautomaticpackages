$ErrorActionPreference = 'Stop'
 
$packageName = 'syspin'
$url32       = 'http://www.technosys.net/download.aspx?file=syspin.exe'
$checksum32  = 'b666a7cc06be4ab39bdc930d26aed0e164bcb9b4336731fe306890600144e1db'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  FileFullPath  = "$toolsPath\syspin.exe"
}

Get-ChocolateyWebFile @packageArgs -GetOriginalFileName
