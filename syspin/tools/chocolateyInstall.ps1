$ErrorActionPreference = 'Stop'
 
$packageName = 'syspin'
$url32       = 'http://www.technosys.net/download.aspx?file=syspin.exe'
$checksum32  = 'a2a4ecd19af6717bc21f806eb74f2589f989b509d1625af6d802b71dff677d88'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  FileFullPath  = "$toolsPath\syspin.exe"
}

Get-ChocolateyWebFile @packageArgs -GetOriginalFileName
