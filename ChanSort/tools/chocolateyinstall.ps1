$ErrorActionPreference = 'Stop'

$packageName = 'ChanSort'
$url32       = 'https://github.com/PredatH0r/ChanSort/releases/download/v2017-11-30/ChanSort_2017-11-30.zip'
$checksum32  = 'af2a7dcc34ae14316848c4d606dbcd5827900ca71bedc5cfc4088628ff92a908'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\ChanSort.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
