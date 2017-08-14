$ErrorActionPreference = 'Stop'

$packageName = 'emdb'
$fileType    = 'EXE'
$url32       = 'http://www.emdb.eu/bin/emdb.zip'
$checksum32  = '088cbb2768b67f9282f44a0fc4151e65567ff4fe08473f2da3c4d2b85ea74a28'
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
