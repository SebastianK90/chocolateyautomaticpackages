$ErrorActionPreference = 'Stop'

$packageName = 'emdb'
$fileType    = 'EXE'
$url32       = 'http://www.emdb.eu/bin/emdb.zip'
$checksum32  = 'da6330d9b73e56ceba48cfa5a0c60855414b8a63de44a688d317446ccb4f0c5f'
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
