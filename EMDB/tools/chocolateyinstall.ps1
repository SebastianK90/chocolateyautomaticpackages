$ErrorActionPreference = 'Stop'

$packageName = 'emdb'
$fileType    = 'EXE'
$url32       = 'http://www.emdb.eu/bin/emdb.zip'
$checksum32  = '948e7061eadcad91d1768aa98800dfbd8a893ceefbd944d429434722b1c477a2'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '/VERYSILENT /COMPONENTS="main,mpciconlib,mpcresources"'

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
 
Install-ChocolateyInstallPackage  $packageName $fileType $silentArgs $FileFullPath
