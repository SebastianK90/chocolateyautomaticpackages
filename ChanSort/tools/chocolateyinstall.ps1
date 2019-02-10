$ErrorActionPreference = 'Stop'

$packageName = 'ChanSort'
$url32       = 'https://github.com/PredatH0r/ChanSort/releases/download/v2019-02-10/ChanSort_2019-02-10.zip'
$checksum32  = 'dee24d938d8263e282e0d815d80a0ca814761d0c0ae29247011d49cf75556f89'
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
