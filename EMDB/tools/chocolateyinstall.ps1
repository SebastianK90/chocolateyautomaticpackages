$ErrorActionPreference = 'Stop'

$packageName = 'emdb'
$fileType    = 'EXE'
$url32       = 'http://www.emdb.eu/bin/emdb.zip'
$checksum32  = '5f4b3285c31453283c59bba2683dfd3aea438d9423eb546d91a0a0b9e1c5222a'
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
