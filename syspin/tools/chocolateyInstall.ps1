$ErrorActionPreference = 'Stop'
 
$packageName = 'syspin'
$url32       = 'http://www.technosys.net/download.aspx?file=syspin.exe'
$checksum32  = 'A2A4ECD19AF6717BC21F806EB74F2589F989B509D1625AF6D802B71DFF677D88'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  FileFullPath  = "$toolsPath\syspin.exe"
}

Get-ChocolateyWebFile @packageArgs -GetOriginalFileName